import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class  AddproductUsecase {
  final SellerRepositry productsRepositry;
  AddproductUsecase({required this.productsRepositry});
  Future<Either<Failure,AddProductEntity>> call (AddProductModel add) async {
    return await productsRepositry.addProduct(add);
  }
}