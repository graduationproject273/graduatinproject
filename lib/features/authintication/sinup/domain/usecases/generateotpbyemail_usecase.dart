import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';

class GenerateotpbyemailUsecase {
 final SignupRepositry repository;

  GenerateotpbyemailUsecase({required this.repository});
  Future<Either<Failure, void>> call(String email) async {
 return    await repository.generateOTPByEmail(email);
  }
}