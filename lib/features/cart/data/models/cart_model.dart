

import 'package:gradution/features/cart/domain/entities/cart_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.productId,
    required super.quantity,
  });

  // تحويل من JSON إلى كائن
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  // تحويل إلى JSON لإرساله إلى السيرفر
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
