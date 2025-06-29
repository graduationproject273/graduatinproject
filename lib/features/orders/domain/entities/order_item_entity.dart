// 📁 order_item_entity.dart

import 'package:equatable/equatable.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';

class OrderItemEntity extends Equatable {
  final int id;
  final int orderId;
  final ProductEntity product;
  final double subtotal;
  final String status;
  final DateTime createdAt;
  final int userId;
  final String userEmail;
  final String userName;

  const OrderItemEntity({
    required this.id,
    required this.orderId,
    required this.product,
    required this.subtotal,
    required this.status,
    required this.createdAt,
    required this.userId,
    required this.userEmail,
    required this.userName,
  });

  @override
  List<Object?> get props => [
        id,
        orderId,
        product,
        subtotal,
        status,
        createdAt,
        userId,
        userEmail,
        userName,
      ];
}
