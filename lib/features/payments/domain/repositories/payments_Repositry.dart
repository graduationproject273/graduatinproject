import 'package:gradution/features/payments/domain/entities/payment_entity.dart';

abstract class PaymentsRepositry {
  Future<StripeSession> createCheckoutSession({
    required int amount,
    required int orderId,
    required String currency,
  });
}
