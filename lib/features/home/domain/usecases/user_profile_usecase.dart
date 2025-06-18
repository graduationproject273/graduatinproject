import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/home/domain/entities/user_profile_entity.dart';
import 'package:gradution/features/home/domain/repositries/user_profile_repo.dart';


class UserProfileUsecase {
  final UserProfileRepo userProfileRepositry;
  UserProfileUsecase(this.userProfileRepositry);
  Future<Either<Failure, UserProfileEntity>> call() async {
    return await userProfileRepositry.getUserProfile();
  }
}