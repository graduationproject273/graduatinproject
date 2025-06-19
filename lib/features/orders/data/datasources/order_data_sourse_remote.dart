import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/databases/params/params.dart';
import 'package:gradution/features/orders/data/models/order_model.dart';

class OrderDataSourseRemote {
  final DioConsumer apiConsumer;
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
  final result = await apiConsumer.get(
    path: EndPoints.baserUrl + EndPoints.orders,
  );

  // Assuming Either is from dartz package
  return result.fold(
    (failure) => throw Exception(failure),
    (response) {
      final data = response.data as List<dynamic>;
      return data.map((orderData) => OrderModel.fromJson(orderData)).toList();
    },
  );
}
}
