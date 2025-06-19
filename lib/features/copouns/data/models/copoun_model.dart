class CouponModel {
  final int id;
  final String code;
  final DateTime startDate;
  final DateTime endDate;
  final double minOrderValue;
  final int discountPercentage;
  final bool isActive;
  final bool isCurrentlyValid;

  CouponModel({
    required this.id,
    required this.code,
    required this.startDate,
    required this.endDate,
    required this.minOrderValue,
    required this.discountPercentage,
    required this.isActive,
    required this.isCurrentlyValid,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'],
      code: json['code'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      minOrderValue: (json['minOrderValue'] as num).toDouble(),
      discountPercentage: json['discountPercentage'],
      isActive: json['isActive'],
      isCurrentlyValid: json['isCurrentlyValid'],
    );
  }
}
