import 'package:gradution/features/cart/domain/entities/cart_seller_entity.dart';
import 'package:gradution/features/cart/domain/entities/category_cart_entity.dart';

class PrdouctCartEntity {
  final int id;
  final String name;
  final double price;
  final double sellingPrice;
  final String? description; // قابل للقيم الفارغة
  final String image;
  final int quantityAvailable;
  final bool specialOffer;
  final double? discountPrice; // قابل للقيم الفارغة
  final String? hardwareSpecifications; // قابل للقيم الفارغة
  final CategoryCartEntity category;
  final CartSellerEntity seller;

  PrdouctCartEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.sellingPrice,
    this.description,
    required this.image,
    required this.quantityAvailable,
    required this.specialOffer,
    this.discountPrice,
    this.hardwareSpecifications,
    required this.category,
    required this.seller,
  });
}