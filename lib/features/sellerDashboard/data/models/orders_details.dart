import 'package:gradution/core/enums/status.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/orders_details_entity.dart';

class OrderDetails extends OrdersDetailsEntity {
  OrderDetails({
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

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
  return OrderDetails(
    id: json['id'],
    orderId: json['orderId'],
    productId: json['productId'],
    productName: json['productName'],
    quantity: json['quantity'],
    unitPrice: (json['unitPrice'] as num).toDouble(),
    subtotal: (json['subtotal'] as num).toDouble(),
    status: OrderItemStatus.values.firstWhere(
      (e) => e.name.toUpperCase() == (json['status'] as String).toUpperCase(),
      orElse: () => OrderItemStatus.PENDING,
    ),
    createdAt: DateTime.parse(json['createdAt']),
    userId: json['userId'],
    userEmail: json['userEmail'],
    userName: json['userName'],
  );
}


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'subtotal': subtotal,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
      'userEmail': userEmail,
      'userName': userName,
    };
  }

  OrderDetails copyWith({
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
    return OrderDetails(
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
