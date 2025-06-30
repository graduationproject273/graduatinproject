class StripeSession {
  final int amount;
  final int orderId;
  final String currency;
  final String sessionId;
  final String url;
  final String status;

  const StripeSession({
    required this.amount,
    required this.orderId,
    required this.currency,
    required this.sessionId,
    required this.url,
    required this.status,
  });
}
