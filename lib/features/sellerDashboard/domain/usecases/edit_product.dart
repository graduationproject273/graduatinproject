import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class EditProduct {
  final SellerRepositry sellerRepositry;
  EditProduct({required this.sellerRepositry});
  Future<Either<Failure, AddProductEntity>> call(AddProductModel add, int id) async {
    return await sellerRepositry.updateProduct(add, id);
  }
  Future<Either<Failure, void>> deleteProduct(int id) async {
    return await sellerRepositry.deleteProduct(id);
  }
 
}