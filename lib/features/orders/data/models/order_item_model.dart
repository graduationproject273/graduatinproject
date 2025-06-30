// 📁 order_item_model.dart

import 'package:gradution/features/orders/domain/entities/order_item_entity.dart';
import 'package:gradution/features/products/data/model/product_model.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.orderId,
    required super.product,
    required super.subtotal,
    required super.status,
    required super.createdAt,
    required super.userId,
    required super.userEmail,
    required super.userName,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      orderId: json['orderId'],
      product: ProductModel.fromJson(json['product']),
      subtotal: (json['subtotal'] as num).toDouble(),
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      userId: json['userId'],
      userEmail: json['userEmail'],
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderId': orderId,
        'product': (product as ProductModel).toJson(),
        'subtotal': subtotal,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
        'userId': userId,
        'userEmail': userEmail,
        'userName': userName,
      };
}
