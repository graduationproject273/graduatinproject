import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/data/models/user_model.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';
import 'package:gradution/features/products/data/model/sub_model/address_model.dart';
import 'package:gradution/features/products/data/model/sub_model/seller_model.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

class UserRepoImpl extends SignupRepositry {
  final DioConsumer dioConsumer;

  UserRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, SellerEntity>> signupSeller(
      SellerEntity seller) async {
    try {
      final response = await dioConsumer.post(
        path: EndPoints.sellerUrl,
        data: SellerModel(
          name: seller.name,
          mobile: seller.mobile,
          mail: seller.mail,
          bankAccountNumber: seller.bankAccountNumber,
          bankAccountHolderName: seller.bankAccountHolderName,
          TIN: seller.TIN,
          swiftCode: seller.swiftCode,
          logo: seller.logo,
          banner: seller.banner,
          addresses: seller.addresses
              .map((e) => AddressModel(
                    street: e.street,
                    city: e.city,
                    state: e.state,
                    zip: e.zip,
                    country: e.country,
                  ))
              .toList(),
          businessName: seller.businessName,
        ).toJson(),
      );

      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) {
          try {
            // ✅ طباعة البيانات للتشخيص
            print('Raw response: ${r.data}');
            print('Response type: ${r.data.runtimeType}');

            final raw = r.data;

            // ✅ فحص البيانات الخام
            if (raw == null) {
              print('Response is null');
              return Left(Failure(errMessage: "Empty response from server"));
            }

            // ✅ فحص إذا كانت البيانات string فارغ
            if (raw is String && raw.trim().isEmpty) {
              print('Response is empty string');
              return Left(
                  Failure(errMessage: "Empty response string from server"));
            }

            Map<String, dynamic> jsonMap;

            // ✅ التعامل مع String response
            if (raw is String) {
              try {
                jsonMap = json.decode(raw);
              } catch (e) {
                print('JSON decode error: $e');
                print('Raw string: "$raw"');
                return Left(Failure(errMessage: "Invalid JSON format: $e"));
              }
            }
            // ✅ التعامل مع Map response
            else if (raw is Map<String, dynamic>) {
              jsonMap = raw;
            }
            // ✅ نوع غير متوقع
            else {
              print('Unexpected response type: ${raw.runtimeType}');
              return Left(Failure(
                  errMessage:
                      "Unexpected response format: ${raw.runtimeType}"));
            }

            print('Parsed JSON: $jsonMap');
            return Right(SellerModel.fromJson(jsonMap));
          } catch (e) {
            print('Error processing response: $e');
            return Left(Failure(errMessage: "Error processing response: $e"));
          }
        },
      );
    } catch (e) {
      print('Network error: $e');
      return Left(Failure(errMessage: "Network error: $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(UserEntity user) async {
    try {
      final response = await dioConsumer.post(
        path: EndPoints.loginUser,
        data: UserModel(
          email: user.email,
          password: user.password,
          token: '',
          roles: [],
        ).toJson(),
      );
      
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) {
          final raw = r.data;
          if (raw == null || raw.toString().trim().isEmpty) {
            return Left(Failure(errMessage: "Empty response from server"));
          }

          final jsonMap = raw is String ? json.decode(raw) : raw;
          return Right(UserModel.fromJson(jsonMap));
        },
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyotp(String emall, String code)async {
   try {
      final response = await dioConsumer.post(
        path: EndPoints.verifyotp ,
        data: {
          'email': emall,
          'code': code,
        }
      );
      
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) {
          final raw = r.data;
          if (raw == null || raw.toString().trim().isEmpty) {
            return Left(Failure(errMessage: "Empty response from server"));
          }

          final jsonMap = raw is String ? json.decode(raw) : raw;
          return Right(UserModel.fromJson(jsonMap));
        },
      );
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> generateOTPByEmail(String emall) async {
    try {
      final response = await dioConsumer
          .post(path: EndPoints.generateotp, data: {'email':emall});
      return response.fold((l) => Left(Failure(errMessage: l)), (r) {
        return Right(null);
      });
    } on Exception catch (e) {
      return Left(Failure(errMessage: "Network error: $e"));
    }
  }
}
