import 'package:gradution/features/cart/domain/entities/cart_seller_entity.dart';

class SellerCartModel extends CartSellerEntity {
  SellerCartModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.mail,
    required super.bankAccountNumber,
    required super.bankAccountHolderName,
    required super.swiftCode,
    required super.logo,
    required super.banner,
    required super.tin,
  });

  factory SellerCartModel.fromJson(Map<String, dynamic> json) {
    // التحقق من وجود user object داخل seller
    final userData = json['user'] as Map<String, dynamic>?;
    
    return SellerCartModel(
      id: _parseToInt(json['id']),
      name: json['name']?.toString() ?? json['businessName']?.toString() ?? '',
      mobile: json['mobile']?.toString() ?? userData?['mobile']?.toString() ?? '',
      mail: json['mail']?.toString() ?? userData?['email']?.toString() ?? '',
      bankAccountNumber: json['bankAccountNumber']?.toString() ?? '',
      bankAccountHolderName: json['bankAccountHolderName']?.toString() ?? '',
      swiftCode: json['swiftCode']?.toString() ?? '',
      logo: json['logo']?.toString() ?? '',
      banner: json['banner']?.toString() ?? '',
      tin: json['tin']?.toString() ?? '',
    );
  }

  // Helper method للتحويل الآمن
  static int _parseToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'mail': mail,
      'bankAccountNumber': bankAccountNumber,
      'bankAccountHolderName': bankAccountHolderName,
      'swiftCode': swiftCode,
      'logo': logo,
      'banner': banner,
      'tin': tin,
    };
  }
}