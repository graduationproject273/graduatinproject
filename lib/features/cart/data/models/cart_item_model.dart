import 'package:gradution/features/cart/data/models/product_cart_model.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.id,
    required super.productcartentity,
    required super.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: _parseToInt(json['id']),
      quantity: _parseToInt(json['quantity']),
      productcartentity: ProductCartModel.fromJson(json['product'] ?? {}),
    );
  }

  // Helper method للتحويل الآمن
  static int _parseToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'product': (productcartentity as ProductCartModel).toJson(),
    };
  }
}