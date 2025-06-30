import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/verify_otp_usecase.dart';

part 'verifyotp_state.dart';

class VerifyotpCubit extends Cubit<VerifyotpState> {
  final VerifyOtpUsecase verifyOtpUsecase;

  VerifyotpCubit(this.verifyOtpUsecase) : super(VerifyotpInitial());

  Future<void> verifyOtp(String email, String otp) async {
    emit(VerifyotpLoading());

    final result = await verifyOtpUsecase.call(email, otp);

    result.fold(
      (failure) {
        emit(VerifyotpError(error: failure.errMessage));
      },
      (userModel) {
        // ✅ تخزين التوكن في الكاش
        if (userModel.token != null && userModel.token!.isNotEmpty) {
          CacheHelper().saveData(key: 'token', value: userModel.token!);
        }

        emit(VerifyotpSuccess(userModel.roles));
      },
    );
  }
}
