import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecase profileUsecase;
  ProfileCubit(this.profileUsecase) : super(ProfileInitial());


   Future<void> clearSeller()async{
     emit(ProfileLoading());
     final result = await profileUsecase.call();
     result.fold((l) => emit(ProfileFailure(l)), (r) => emit(RemoveSeller()));
   }
}

