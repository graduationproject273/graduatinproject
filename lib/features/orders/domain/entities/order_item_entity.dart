class OrderItemEntity {
  final int id;
  final int orderId;
  final int productId;
  final String productName;
  final int quantity;
  final double unitPrice;
  final double subtotal;
  final String status;
  final DateTime createdAt;
  final int userId;
  final String userEmail;
  final String userName;

  const OrderItemEntity({
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
}
