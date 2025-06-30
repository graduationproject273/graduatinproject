import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/get_all_category_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/orders_details_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/profile_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/seller_summary_entity.dart';

abstract class SellerRepositry {
  Future<Either<Failure,AddProductEntity>> addProduct(AddProductModel add);
  Future<Either<Failure,AddProductEntity>> updateProduct(AddProductModel add, int id);
  Future<Either<Failure, void>> deleteProduct( int id);

  Future<Either<Failure, List<GetAllCategoryEntity>>> getAllProducts();
  Future<Either<Failure, void>> deleteSeller();
    Future<Either<Failure, ProfileEntity>> getProfile(int id); 

  Future<Either<Failure, SellerSummaryEntity>> getsellerSummary(); 
  Future<Either<Failure, List<OrdersDetailsEntity>>> getOrdersforsellers();
  Future<Either<Failure, void>> updateStatus(int id, String status);
}
