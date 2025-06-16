import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

class SignupSellerUsecase {
  final SignupRepositry repository;

  SignupSellerUsecase(this.repository);

  Future<Either<Failure, void>> call(SellerEntity seller) async {
    return await repository.signupSeller(seller);
  }
}
