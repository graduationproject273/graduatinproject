import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/orders_details_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class GetordersUsecase {
  final SellerRepositry repositry;
  GetordersUsecase(this.repositry);
  Future<Either<Failure, List<OrdersDetailsEntity>>> call() => repositry.getOrdersforsellers();
}