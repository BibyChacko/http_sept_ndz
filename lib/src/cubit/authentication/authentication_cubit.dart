import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/api_response_model.dart';
import 'authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationRepository _repository = AuthenticationRepository();

  AuthenticationCubit() : super(AuthenticationInitial());

  login(String email,String password) async{
    emit(AuthenticationLoading());
    ApiResponseModel response = await _repository.login(email, password);
    if(response.status){
      emit(AuthenticationSuccess());
    }else{
      emit(AuthenticationFailure());
    }
  }

}
