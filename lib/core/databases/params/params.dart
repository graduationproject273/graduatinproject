class OrderParams {
  final String shippingAddress;
  final String paymentMethod;
  final List<dynamic> orderItems;
  

  OrderParams( { 
  
    required this.shippingAddress,
    required this.paymentMethod,
    required this.orderItems,
  });
}