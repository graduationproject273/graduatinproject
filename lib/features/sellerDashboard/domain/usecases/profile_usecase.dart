import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/profile_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class ProfileUsecase {
  final SellerRepositry repositry;

  ProfileUsecase(this.repositry);

  Future<Either<Failure, void>> call() => repositry.deleteSeller();

  Future<Either<Failure, ProfileEntity>> getProfile() => repositry.getProfile(1);
}