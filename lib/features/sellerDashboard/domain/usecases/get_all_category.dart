import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/get_all_category_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class  GetAllCategory {
  final SellerRepositry productsRepositry;
  GetAllCategory({required this.productsRepositry});
  Future<Either<Failure,List<GetAllCategoryEntity>>> call ( ) async {
    return await productsRepositry.getAllProducts();
  }
}