import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/home/data/models/user_profile_model.dart';
import 'package:gradution/features/home/domain/entities/user_profile_entity.dart';
import 'package:gradution/features/home/domain/repositries/user_profile_repo.dart';
class UserProfileRepoImpl extends UserProfileRepo{
  final DioConsumer dioConsumer;
  UserProfileRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async{
    try {
      final response = await dioConsumer.get(
        path: EndPoints.userProfile,
      );
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(UserProfileModel.fromJson(r.data)),
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}