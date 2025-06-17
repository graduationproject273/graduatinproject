import 'package:gradution/features/cart/data/models/category_cart_model.dart';
import 'package:gradution/features/cart/data/models/seller_cart_model.dart';
import 'package:gradution/features/cart/domain/entities/prdouct_cart_entity.dart';

class ProductCartModel extends PrdouctCartEntity {
  ProductCartModel({
    required super.id,
    required super.name,
    required super.price,
    required super.sellingPrice,
    super.description,
    required super.image,
    required super.quantityAvailable,
    required super.specialOffer,
    super.discountPrice,
    super.hardwareSpecifications,
    required super.category,
    required super.seller,
  });

  factory ProductCartModel.fromJson(Map<String, dynamic> json) {
    return ProductCartModel(
      id: _parseToInt(json['id']),
      name: json['name']?.toString() ?? '',
      price: _parseToDouble(json['price']),
      sellingPrice: _parseToDouble(json['sellingPrice']),
      description: json['description']?.toString(),
      image: json['image']?.toString() ?? '',
      quantityAvailable: _parseToInt(json['quantityAvailable']),
      specialOffer: json['specialOffer'] == true,
      discountPrice: _parseToDouble(json['discountPrice']),
      hardwareSpecifications: json['hardwareSpecifications']?.toString(),
      category: CategoryCartModel.fromJson(json['category'] ?? {}),
      seller: SellerCartModel.fromJson(json['seller'] ?? {}),
    );
  }

  // Helper methods للتحويل الآمن
  static int _parseToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  static double _parseToDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'sellingPrice': sellingPrice,
      'description': description,
      'image': image,
      'quantityAvailable': quantityAvailable,
      'specialOffer': specialOffer,
      'discountPrice': discountPrice,
      'hardwareSpecifications': hardwareSpecifications,
      'category': (category as CategoryCartModel).toJson(),
      'seller': (seller as SellerCartModel).toJson(),
    };
  }
}