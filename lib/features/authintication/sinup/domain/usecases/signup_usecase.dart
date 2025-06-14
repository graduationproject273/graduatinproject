import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';

class SignupUsecase {
  final SignupRepositry signupRepositry;
  SignupUsecase(this.signupRepositry);

  Future<Either<Failure, String>> call(UserEntity user) async {
    return await signupRepositry.signupUser(user);
  }
}
