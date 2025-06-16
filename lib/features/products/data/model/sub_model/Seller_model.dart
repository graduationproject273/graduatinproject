import 'package:gradution/features/products/data/model/sub_model/address_model.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

class SellerModel extends SellerEntity {
  SellerModel({
    required super.name,
    required super.mobile,
    required super.mail,
    required super.bankAccountNumber,
    required super.bankAccountHolderName,
    required super.TIN,
    required super.swiftCode,
    required super.logo,
    required super.banner,
    required super.addresses,
    required super.businessName,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      name: json['name'] ?? '',
      businessName: json['businessName'] ?? '',
      mail: json['mail'] ?? '',
      mobile: json['mobile'] ?? '',
      bankAccountNumber: json['bankAccountNumber'] ?? '',
      bankAccountHolderName: json['bankAccountHolderName'] ?? '',
      swiftCode: json['swiftCode'] ?? '',
      logo: json['logo'] ?? '',
      banner: json['banner'] ?? '',
      // ✅ إصلاح: استخدام 'tin' بدلاً من 'TIN'
      TIN: json['tin'] ?? '',
      // ✅ إصلاح: التعامل مع null في address
      addresses: json['address'] != null && json['address'] is Map<String, dynamic>
          ? [AddressModel.fromJson(json['address'] as Map<String, dynamic>)]
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'name': name,
      'mobile': mobile,
      'mail': mail,
      'bankAccountNumber': bankAccountNumber,
      'bankAccountHolderName': bankAccountHolderName,
      // ✅ استخدام 'tin' في الإرسال أيضاً
      'tin': TIN,
      'swiftCode': swiftCode,
      'logo': logo,
      'banner': banner,
      // ✅ إرسال addresses كـ array
      'addresses': addresses.isNotEmpty
          ? addresses.map((address) => (address as AddressModel).toJson()).toList()
          : [],
    };
  }
}