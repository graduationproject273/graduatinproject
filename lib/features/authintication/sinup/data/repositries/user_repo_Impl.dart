import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/data/models/user_model.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';
import 'package:gradution/features/products/data/model/sub_model/seller_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

class UserRepoImpl extends SignupRepositry {
  final DioConsumer dioConsumer;

  UserRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, String>> signupUser(UserEntity user) async {
    try {
      final response = await dioConsumer.post(
       path:    EndPoints.loginUser,
        data: {
      'email': user.email,
      'password': user.password,
    },
      );

    return response.fold(
  (l) => Left(Failure(errMessage: l)),
  (r) => Right(r.data['token'] as String), // ✅ رجّع التوكن
);// ✅ رجّع اليوزر مع التوكن
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(UserEntity user)async {
    
      try {
        final response = await dioConsumer.post(
        path:   EndPoints.loginUser,
          data: UserModel(
                  email: user.email,
                  password: user.password,
                  token: '' /* مبدئيًا */)
              .toJson(),
        );
 return response.fold(
  (l) => Left(Failure(errMessage: l)),
  (r) => Right(UserModel.fromJson(r.data)),
);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }

  @override
  Future<Either<Failure, SellerEntity>> signupSeller(SellerEntity user) async{
    try {
      final response = await dioConsumer.post(
        path: EndPoints.sellerUrl,
        data: SellerModel(
          id: user.id,
          user: user.user,
          name: user.name,
          mobile: user.mobile,
          mail: user.mail,
          bankAccountNumber: user.bankAccountNumber,
          bankAccountHolderName: user.bankAccountHolderName,
          swiftCode: user.swiftCode,
          logo: user.logo,
          banner: user.banner,
          addresses: user.addresses,
        ),
      );
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(SellerModel.fromJson(r.data)),
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
  }

