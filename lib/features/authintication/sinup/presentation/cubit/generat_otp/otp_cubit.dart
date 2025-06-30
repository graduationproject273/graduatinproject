import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/generateotpbyemail_usecase.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.generateotpbyemailUsecase) : super(OtpInitial());
  final GenerateotpbyemailUsecase generateotpbyemailUsecase;

  Future<void> generateOtp(String email) async {
    emit(OtpLoading());
    final result = await generateotpbyemailUsecase.call(email);
    result.fold(
      (failure) {
        emit(OtpError(error: failure.errMessage.toString()));
      },
      (sellerEntity) {
        emit(OtpLoaded());
      },
    );
  }
}
