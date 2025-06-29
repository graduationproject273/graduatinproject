// 📁 order_entity.dart

import 'package:equatable/equatable.dart';
import 'package:gradution/features/orders/domain/entities/order_item_entity.dart';

class OrderEntity extends Equatable {
  final int id;
  final int userId;
  final String userEmail;
  final DateTime orderDate;
  final double totalAmount;
  final String? couponCode;
  final double? originalAmount;
  final double? discountAmount;
  final String status;
  final String shippingAddress;
  final String paymentMethod;
  final String? trackingNumber;
  final List<OrderItemEntity> orderItems;

  const OrderEntity({
    required this.id,
    required this.userId,
    required this.userEmail,
    required this.orderDate,
    required this.totalAmount,
    this.couponCode,
    this.originalAmount,
    this.discountAmount,
    required this.status,
    required this.shippingAddress,
    required this.paymentMethod,
    this.trackingNumber,
    required this.orderItems,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        userEmail,
        orderDate,
        totalAmount,
        couponCode,
        originalAmount,
        discountAmount,
        status,
        shippingAddress,
        paymentMethod,
        trackingNumber,
        orderItems,
      ];
}
