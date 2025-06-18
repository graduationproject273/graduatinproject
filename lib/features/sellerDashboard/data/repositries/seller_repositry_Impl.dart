import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:gradution/core/connection/network_info.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/data/datasources/get_all_category_datasourse_local.dart';
import 'package:gradution/features/sellerDashboard/data/datasources/get_all_category_datasourse_remote.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/data/models/get_all_category_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class SellerRepositryImpl extends SellerRepositry {
  final DioConsumer dioConsumer;
  final NetworkInfo networkInfo;

  final GetAllCategoryDatasourseRemote remote;
  final GetAllCategoryDatasourseLocal local;

  SellerRepositryImpl(
      this.dioConsumer, this.remote, this.local, this.networkInfo);

  @override
  Future<Either<Failure, AddProductEntity>> addProduct(
      AddProductModel add) async {
    try {
      final response = await dioConsumer.post(
        path: EndPoints.addProduct,
        data: add.toJson(),
      );
      return response.fold(
        (l) => Left(Failure(errMessage: l)),
        (r) => Right(AddProductModel.fromJson(r.data)),
      );
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetAllCategoryModel>>> getAllProducts() async {
    try {
      final localdata = await local.getCatergoryLocal();
      unawaited(
          _update(EndPoints.getAllcatecgory)); // لا تؤثر على النتيجة مباشرةً
      return right(localdata);
    } catch (_) {
      // إذا فشل الـ local نحاول عبر الـ remote
      if (await networkInfo.isConnected!) {
        try {
          final remoteModel =
              await remote.getCatergory(EndPoints.getAllcatecgory);
          await local.cacheCategory(remoteModel);
          return Right(remoteModel);
        } on ServerException catch (e) {
          return left(Failure(errMessage: e.errorModel.errorMessage));
        }
      } else {
        return left(Failure(errMessage: 'No internet connection'));
      }
    }
  }

     Future<void> _update(String e) async {
  if (await networkInfo.isConnected!) {
    try {
      final remoteModel = await remote.getCatergory(EndPoints.getAllcatecgory);
      await local.cacheCategory(remoteModel, );
    } catch (_) {
      // تجاهل الخطأ بصمت أو سجل لو حبيت
    }
  }
}
}


