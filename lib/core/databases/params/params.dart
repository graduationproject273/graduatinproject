class OrderParams {
  final String token;
  final String shippingAddress;
  final String paymentMethod;
  final List<dynamic> orderItems;
  

  OrderParams( { 
   required this.token,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.orderItems,
  });
}