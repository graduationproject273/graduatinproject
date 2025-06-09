class OrderEntity {
  final int id;
  final int userId;
  final String userEmail;
  final DateTime orderDate;
  final double totalAmount;
  final String status;
  final String shippingAddress;
  final String paymentMethod;
  final List<OrderItemEntity> orderItems;

  OrderEntity({
    required this.id,
    required this.userId,
    required this.userEmail,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.orderItems,
  });
}

class OrderItemEntity {
  final int productId;
  final int quantity;
  final double price;

  OrderItemEntity({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  
}
