import 'package:gradution/features/sellerDashboard/data/models/address_model.dart';
import 'package:gradution/features/sellerDashboard/data/models/user_seller_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/seller_entity.dart';

class SellerModel extends SellerEntity {
  SellerModel({
    super.id,
    UserModel? super.user,
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
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      id: json['id'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      name: json['name'],
      mobile: json['mobile'],
      mail: json['mail'],
      bankAccountNumber: json['bankAccountNumber'],
      bankAccountHolderName: json['bankAccountHolderName'],
      TIN: json['tin'], // لو رجعت null عادي
      swiftCode: json['swiftCode'],
      logo: json['logo'],
      banner: json['banner'],
      addresses: (json['addresses'] as List)
          .map((addressJson) => AddressModel.fromJson(addressJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
      'mail': mail,
      'bankAccountNumber': bankAccountNumber,
      'bankAccountHolderName': bankAccountHolderName,
      'TIN': TIN,
      'swiftCode': swiftCode,
      'logo': logo,
      'banner': banner,
      'addresses': addresses.map((e) => (e as AddressModel).toJson()).toList(),
    };
  }
}
