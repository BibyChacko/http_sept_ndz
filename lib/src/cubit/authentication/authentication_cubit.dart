import 'dart:convert';

import 'package:api_cubit/src/helper/storage_helper.dart';
import 'package:api_cubit/src/helper/storage_keys.dart';
import 'package:api_cubit/src/models/user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/api_response_model.dart';
import 'authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
 final AuthenticationRepository _repository = AuthenticationRepository();

  AuthenticationCubit() : super(AuthenticationInitial());

  login(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      ApiResponseModel response = await _repository.login(email, password);
      if (response.status) {
        // Store token and the user data
        UserData userData =
            UserData.fromJson(response.data); // convert map into object
        await StorageHelper.writeData(StorageKeys.jwt.name, response.token!);
        await StorageHelper.writeData(
            StorageKeys.userData.name,
            jsonEncode(userData
                .toJson())); // object --> keyValuePair --> jsonObjectString
        await StorageHelper.writeData(StorageKeys.loginTime.name, DateTime.now().toString());
        emit(AuthenticationSuccess());
      } else {
        String errorMessage = response.error!;
        emit(AuthenticationFailure(errorMessage));
      }
    } catch (ex) {
      emit(const AuthenticationFailure("Something went wrong"));
    }
  }


  checkAutoLogin() async {
    emit(AuthenticationLoading());
    bool isAutoLoginAllowed = await _repository.checkAutoLogin();
    if(isAutoLoginAllowed){
      emit(AuthenticationSuccess());
    }else{
      emit(AuthenticationInitial());
    }
  }


  logout() async {
    emit(AuthenticationLoading());
    await StorageHelper.clearAllData();
    emit(AuthenticationInitial());
    // We have to clear the user data
  }

}
