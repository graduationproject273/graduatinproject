import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

abstract class SignupRepositry {

  Future<Either<Failure, UserEntity>> codePin(String emall, String code);
    Future<Either<Failure, void>> generateOTPByEmail(String emall);

  Future<Either<Failure, SellerEntity>> signupSeller(SellerEntity user);
}