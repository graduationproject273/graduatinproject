
import 'package:gradution/features/products/domain/entities/sub_entities/category_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

class ProductEntity {
  final int id;
  final String name;
  final double price;
  final String description;
  final String? image;
  final int quantityAvailable;
  final bool specialOffer;
  final String hardwareSpecifications;
  final CategoryEntity category;
  final SellerEntity seller;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.quantityAvailable,
    required this.specialOffer,
    required this.hardwareSpecifications,
    required this.category,
    required this.seller,
  });
}



