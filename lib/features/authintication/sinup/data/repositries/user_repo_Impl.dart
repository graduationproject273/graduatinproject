import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/data/models/user_model.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';

class UserRepoImpl extends SignupRepositry {
  final DioConsumer dioConsumer;

  UserRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, UserEntity>> signupUser(UserEntity user) async {
    try {
      final response = await dioConsumer.post(
        EndPoints.signupUser,
        data: UserModel(
                email: user.email,
                password: user.password,
                token: '' /* مبدئيًا */)
            .toJson(),
      );

      final userModel =
          UserModel.fromJson(response); // استخراج التوكن من الريسبونس
      return Right(userModel); // ✅ رجّع اليوزر مع التوكن
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
