import 'package:gradution/features/orders/data/models/order_item_model.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';
import 'package:gradution/features/orders/domain/entities/order_item_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.userId,
    required super.userEmail,
    required super.orderDate,
    required super.totalAmount,
    super.couponCode,
    super.originalAmount,
    super.discountAmount,
    required super.status,
    required super.shippingAddress,
    required super.paymentMethod,
    super.trackingNumber,
    required List<OrderItemEntity> orderItems,
  }) : super(orderItems: orderItems);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['userId'],
      userEmail: json['userEmail'],
      orderDate: DateTime.parse(json['orderDate']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      couponCode: json['couponCode'],
      originalAmount: json['originalAmount'] != null
          ? (json['originalAmount'] as num).toDouble()
          : null,
      discountAmount: json['discountAmount'] != null
          ? (json['discountAmount'] as num).toDouble()
          : null,
      status: json['status'],
      shippingAddress: json['shippingAddress'],
      paymentMethod: json['paymentMethod'],
      trackingNumber: json['trackingNumber'],
      orderItems: (json['orderItems'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'userEmail': userEmail,
        'orderDate': orderDate.toIso8601String(),
        'totalAmount': totalAmount,
        'couponCode': couponCode,
        'originalAmount': originalAmount,
        'discountAmount': discountAmount,
        'status': status,
        'shippingAddress': shippingAddress,
        'paymentMethod': paymentMethod,
        'trackingNumber': trackingNumber,
        'orderItems':
            orderItems.map((e) => (e as OrderItemModel).toJson()).toList(),
      };
}
