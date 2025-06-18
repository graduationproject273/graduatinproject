import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/home/domain/entities/user_profile_entity.dart';

abstract class UserProfileRepo {
  Future<Either<Failure, UserProfileEntity>> getUserProfile();
}