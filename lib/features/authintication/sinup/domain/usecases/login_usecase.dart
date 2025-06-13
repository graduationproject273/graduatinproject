import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';

class LoginUsecase {
  final SignupRepositry signupRepositry;
  LoginUsecase(this.signupRepositry);

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await signupRepositry.loginUser(user);
  }
}