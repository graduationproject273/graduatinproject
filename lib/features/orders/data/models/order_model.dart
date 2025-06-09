import 'package:gradution/features/orders/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.userId,
    required super.userEmail,
    required super.orderDate,
    required super.totalAmount,
    required super.status,
    required super.shippingAddress,
    required super.paymentMethod,
    required super.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['userId'],
      userEmail: json['userEmail'],
      orderDate: DateTime.parse(json['orderDate']),
      totalAmount: json['totalAmount']?.toDouble() ?? 0.0,
      status: json['status'],
      shippingAddress: json['shippingAddress'],
      paymentMethod: json['paymentMethod'],
      orderItems: (json['orderItems'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
    );
  }

Map<String, dynamic> toJson() {
  return {
    "id": id,
    "userId": userId,
    "userEmail": userEmail,
    "orderDate": orderDate.toIso8601String(),
    "totalAmount": totalAmount,
    "status": status,
    "shippingAddress": shippingAddress,
    "paymentMethod": paymentMethod,
    "orderItems": orderItems.map((item) {
      if (item is OrderItemModel) {
        return item.toJson();
      }
      return {
        "productId": item.productId,
        "quantity": item.quantity,
        "price": item.price,
      };
    }).toList(),
  };
}
 
}

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.productId,
    required super.quantity,
    required super.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
        'price': price,
      };
}
