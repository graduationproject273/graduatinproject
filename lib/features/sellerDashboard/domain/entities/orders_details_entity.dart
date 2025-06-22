import 'package:gradution/core/enums/status.dart';

class OrdersDetailsEntity {
  final int id;
  final int orderId;
  final int productId;
  final String productName;
  final int quantity;
  final double unitPrice;
  final double subtotal;
  final OrderItemStatus status; // Should be OrderItemStatus, not String
  final DateTime createdAt;
  final int userId;
  final String userEmail;
  final String userName;

  const OrdersDetailsEntity({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
    required this.status,
    required this.createdAt,
    required this.userId,
    required this.userEmail,
    required this.userName,
  });

  OrdersDetailsEntity copyWith({
    int? id,
    int? orderId,
    int? productId,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    OrderItemStatus? status,
    DateTime? createdAt,
    int? userId,
    String? userEmail,
    String? userName,
  }) {
    return OrdersDetailsEntity(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      subtotal: subtotal ?? this.subtotal,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
    );
  }
}
