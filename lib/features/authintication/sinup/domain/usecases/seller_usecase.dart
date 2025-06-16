import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

class SellerUsecase {
  final SignupRepositry signupRepositry;
  SellerUsecase({required this.signupRepositry});

  Future<Either<Failure, SellerEntity>> signupSeller(SellerEntity seller) async {
    return await signupRepositry.signupSeller(seller);
  }
}