

import 'package:gradution/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.productId,
    required super.quantity,
  });

  // تحويل من JSON إلى كائن
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
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
  copyWith({
    int? productId,
    int? quantity,
  }) {
    return CartModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
