import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/databases/params/params.dart';
import 'package:gradution/features/orders/data/models/order_model.dart';

class OrderDataSourseRemote {
  final ApiConsumer apiConsumer;
  OrderDataSourseRemote(this.apiConsumer);
  Future<void> createOrder(
    OrderParams order,
  ) async {
    await apiConsumer.post(
      
       path:  EndPoints.baserUrl + EndPoints.orders,
        data: {
          "shippingAddress": order.shippingAddress,
          "paymentMethod": order.paymentMethod,
          "items": order.orderItems,
        });
  }

  Future<List<OrderModel>> getAllOrders() async {
    // Fetch all orders from the API
    List<OrderModel> orders = [];
    final response = await apiConsumer.get(
 path:      EndPoints.baserUrl + EndPoints.orders,
     
    );
    for (var orderData in response) {
      orders.add(OrderModel.fromJson(orderData));
    }
    return orders;
  }
}
