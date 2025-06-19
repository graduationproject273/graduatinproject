import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class UpdateStatusOrder {
  final SellerRepositry repositry;
  UpdateStatusOrder(this.repositry);

  Future<Either<Failure, void>> call(int id, String status) => repositry.updateStatus(id, status);
}