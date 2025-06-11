import 'package:gradution/features/sellerDashboard/domain/entities/address_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/user_seller_entity.dart';

class SellerEntity {
  final int? id; // من ال response
  final UserEntity? user; // كائن المستخدم
  final String name;
  final String mobile;
  final String mail;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final String? TIN;
  final String swiftCode;
  final String logo;
  final String banner;
  final List<AddressEntity> addresses;

  SellerEntity({
    this.id,
    this.user,
    required this.name,
    required this.mobile,
    required this.mail,
    required this.bankAccountNumber,
    required this.bankAccountHolderName,
    this.TIN,
    required this.swiftCode,
    required this.logo,
    required this.banner,
    required this.addresses,
  });
}
