
import 'package:gradution/features/products/domain/entities/sub_entities/address_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/user_entity.dart';

class SellerEntity {
  final int id;
  final UserEntity user;
  final String name;
  final String mobile;
  final String mail;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final String swiftCode;
  final String logo;
  final String banner;
  final List<AddressEntity> addresses;
  final String? tin;

  SellerEntity({
    required this.id,
    required this.user,
    required this.name,
    required this.mobile,
    required this.mail,
    required this.bankAccountNumber,
    required this.bankAccountHolderName,
    required this.swiftCode,
    required this.logo,
    required this.banner,
    required this.addresses,
    this.tin,
  });
}