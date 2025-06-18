part of 'userprofile_cubit.dart';

sealed class UserprofileState extends Equatable {
  const UserprofileState();

  @override
  List<Object> get props => [];
}

final class UserprofileInitial extends UserprofileState {}

final class UserProfileLoading extends UserprofileState {}

final class UserProfileFailure extends UserprofileState {
  final String errMessage;
  const UserProfileFailure(this.errMessage);
}

final class GetuserProfile extends UserprofileState {
  final UserProfileEntity profile;
  const GetuserProfile(this.profile);
}