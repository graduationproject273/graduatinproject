import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/features/payments/data/models/payment_model.dart';
import 'package:gradution/features/payments/domain/entities/payment_entity.dart';
import 'package:gradution/features/payments/domain/repositories/payments_Repositry.dart';

class PaymentsRepositryImpl extends PaymentsRepositry {
  final DioConsumer dioConsumer;

  PaymentsRepositryImpl({required this.dioConsumer});

  @override
  Future<StripeSession> createCheckoutSession({
    required int amount,
    required int orderId,
    required String currency,
  }) async {
    final result = await dioConsumer.post(
      path: EndPoints.stripeSession,
      data: {
        "amount": amount,
        "orderId": orderId,
        "currency": currency,
      },
    );
    return result.fold(
      (error) => throw Exception(error),
      (response) => StripeSessionModel.fromJson(response.data as Map<String, dynamic>),
    );
  }
}
