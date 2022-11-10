part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadSuccess extends ProfileState {
 final UserData userData;

 const ProfileLoadSuccess(this.userData);

  @override
  List<Object> get props => [userData];
}
class ProfileLoadError extends ProfileState {
  @override
  List<Object> get props => [];
}

