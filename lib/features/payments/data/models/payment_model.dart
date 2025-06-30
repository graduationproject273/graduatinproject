import 'package:gradution/features/payments/domain/entities/payment_entity.dart';

class StripeSessionModel extends StripeSession{
  StripeSessionModel({
    required super.amount, 
    required super.orderId, 
    required super.currency, 
    required super.sessionId, 
    required super.url, required super.status});


factory StripeSessionModel.fromJson(Map<String, dynamic> json) {
    return StripeSessionModel(
      amount: json['amount'],
      orderId: json['orderId'],
      currency: json['currency'],
      sessionId: json['sessionId'],
      url: json['url'],
      status: json['status'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'orderId': orderId,
      'currency': currency,
    };
  }
}
