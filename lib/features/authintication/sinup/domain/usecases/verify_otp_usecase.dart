import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';

class VerifyOtpUsecase {
  final SignupRepositry repository;

  VerifyOtpUsecase(this.repository);

  Future<Either<Failure, void>> call(String emall, String code) async {
    return await repository.verifyotp(emall, code);
  }
}