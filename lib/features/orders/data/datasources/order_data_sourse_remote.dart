import 'dart:convert'; // مهم عشان نستخدم jsonDecode
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/databases/params/params.dart';
import 'package:gradution/features/orders/data/models/order_model.dart';

class OrderDataSourseRemote {
  final DioConsumer apiConsumer;
  OrderDataSourseRemote(this.apiConsumer);

  // إنشاء طلب جديد
  Future<void> createOrder(OrderParams order) async {
    await apiConsumer.post(
      path: EndPoints.baserUrl + EndPoints.orders,
      data: {
        "shippingAddress": order.shippingAddress,
        "paymentMethod": order.paymentMethod,
        "items": order.orderItems,
      },
    );
  }

  // جلب كل الطلبات
  Future<List<OrderModel>> getAllOrders() async {
    final result = await apiConsumer.get(
      path: EndPoints.baserUrl + EndPoints.orders,
    );

    return result.fold(
      (failure) => throw Exception(failure),
      (response) {
        final rawData = response.data;

        // تحويل البيانات لو كانت راجعة كـ String
        final decodedData =
            rawData is String ? jsonDecode(rawData) : rawData;

        // تأكد إن النوع List
        if (decodedData is List) {
          return decodedData
              .map((orderData) => OrderModel.fromJson(orderData))
              .toList();
        } else {
          throw Exception('Unexpected response format: $decodedData');
        }
      },
    );
  }
}
