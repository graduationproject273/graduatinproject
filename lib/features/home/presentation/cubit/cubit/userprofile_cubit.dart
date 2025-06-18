import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/home/domain/entities/user_profile_entity.dart';
import 'package:gradution/features/home/domain/usecases/user_profile_usecase.dart';

part 'userprofile_state.dart';

class UserprofileCubit extends Cubit<UserprofileState> {
  final UserProfileUsecase userProfileUsecase;
  UserprofileCubit(this.userProfileUsecase) : super(UserprofileInitial());

  Future<void> getUserProfile() async {
    emit(UserProfileLoading());
    final failureOrProfile = await userProfileUsecase.call();
    failureOrProfile.fold((failure) => emit(UserProfileFailure(
       failure.errMessage,
    )), (profile) => emit(GetuserProfile( profile )));
  }
}
