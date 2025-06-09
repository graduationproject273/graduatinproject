
import 'package:gradution/features/products/data/model/sub_model/address_model.dart';
import 'package:gradution/features/products/data/model/sub_model/user_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/address_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/user_entity.dart';

class SellerModel extends SellerEntity {
  SellerModel({
    required super.id,
    required super.user,
    required super.name,
    required super.mobile,
    required super.mail,
    required super.bankAccountNumber,
    required super.bankAccountHolderName,
    required super.swiftCode,
    required super.logo,
    required super.banner,
    required super.addresses,
    super.tin,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
        id: json['id'],
        user: UserModel.fromJson(json['user']) as UserEntity,
        name: json['name'],
        mobile: json['mobile'],
        mail: json['mail'],
        bankAccountNumber: json['bankAccountNumber'],
        bankAccountHolderName: json['bankAccountHolderName'],
        swiftCode: json['swiftCode'],
        logo: json['logo'],
        banner: json['banner'],
        addresses: (json['addresses'] as List)
            .map((e) => AddressModel.fromJson(e) as AddressEntity)
            .toList(),
        tin: json['tin'],
      );

       Map<String, dynamic> toJson() => {
    'id': id,
    'user': (user as UserModel).toJson(),
    'name': name,
    'mobile': mobile,
    'mail': mail,
    'bankAccountNumber': bankAccountNumber,
    'bankAccountHolderName': bankAccountHolderName,
    'swiftCode': swiftCode,
    'logo': logo,
    'banner': banner,
    'addresses': addresses.map((e) => (e as AddressModel).toJson()).toList(),
    'tin': tin,
  };
}