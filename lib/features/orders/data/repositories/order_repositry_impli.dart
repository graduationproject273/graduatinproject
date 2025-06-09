import 'package:dartz/dartz.dart';
import 'package:gradution/core/connection/network_info.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/core/databases/params/params.dart';
import 'package:gradution/features/orders/data/datasources/order_data_sourse_local.dart';
import 'package:gradution/features/orders/data/datasources/order_data_sourse_remote.dart';
import 'package:gradution/features/orders/data/models/order_model.dart';
import 'package:gradution/features/orders/domain/repositories/order_repositry.dart';

class OrderRepositoryImpl implements OrderRepositry {
  final OrderDataSourseRemote remoteDataSource;
  final OrderDataSourseLocal localDataSource;
  final NetworkInfo networkInfo;

  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<OrderModel>>> getAllOrders() async {
    if (await networkInfo.isConnected!) {
      try {
        final orders = await remoteDataSource.getAllOrders();
        localDataSource.cachedOrder(orders,'');
        return Right(orders);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final cachedOrders = await localDataSource.getLastOrder('');
        return Right(cachedOrders);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, void>> createOrder(OrderParams order) async {
    if (await networkInfo.isConnected!) {
      try {
        await remoteDataSource.createOrder(order);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "لا يوجد اتصال بالإنترنت"));
    }
  }
}
