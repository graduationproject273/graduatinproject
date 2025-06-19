// ignore_for_file: constant_identifier_names

enum OrderItemStatus {
  PENDING,
  PROCESSING,
  SHIPPED,
  DELIVERED,
  CANCELLED
}

extension OrderItemStatusExtension on OrderItemStatus {
  String get name => toString().split('.').last;
}

