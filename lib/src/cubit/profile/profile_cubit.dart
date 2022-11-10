import 'dart:convert';

import 'package:api_cubit/src/helper/storage_helper.dart';
import 'package:api_cubit/src/helper/storage_keys.dart';
import 'package:api_cubit/src/models/user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getProfileInfo() async {
    emit(ProfileLoading());
    try {
      String? profileInfoJSON =
          await StorageHelper.readData(StorageKeys.userData.name);
      if (profileInfoJSON == null) {
        emit(ProfileLoadError());
        return;
      }
      var profileInfoRaw = jsonDecode(profileInfoJSON);
      UserData userData = UserData.fromJson(profileInfoRaw);
      emit(ProfileLoadSuccess(userData));
    } catch (ex) {
      emit(ProfileLoadError());
    }
  }
}
