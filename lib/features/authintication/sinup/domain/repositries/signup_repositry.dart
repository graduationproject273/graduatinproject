import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';

abstract class SignupRepositry {
  Future<Either<Failure, UserEntity>> signupUser(UserEntity user);
  Future<Either<Failure, UserEntity>> loginUser(UserEntity user);
}
