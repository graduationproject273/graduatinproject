import 'package:gradution/features/orders/domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.orderId,
    required super.productId,
    required super.productName,
    required super.quantity,
    required super.unitPrice,
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
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
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
        'productId': productId,
        'productName': productName,
        'quantity': quantity,
        'unitPrice': unitPrice,
        'subtotal': subtotal,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
        'userId': userId,
        'userEmail': userEmail,
        'userName': userName,
      };
}
