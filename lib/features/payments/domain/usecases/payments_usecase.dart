import 'package:gradution/features/payments/domain/entities/payment_entity.dart';
import 'package:gradution/features/payments/domain/repositories/payments_Repositry.dart';

class PaymentsUsecase {
  final PaymentsRepositry paymentsRepositry;

  PaymentsUsecase({required this.paymentsRepositry});

  Future<StripeSession> createCheckoutSession({
    required int amount,
    required int orderId,
    required String currency,
  }) async {
    return await paymentsRepositry.createCheckoutSession(
      amount: amount,
      orderId: orderId,
      currency: currency,
    );
  }

}
