import 'package:gradution/features/products/domain/entities/sub_entities/address_entity.dart';

class SellerEntity {
  final String name;
  final String mobile;
  final String mail;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final String TIN;
  final String swiftCode;
  final String logo;
  final String banner;
  final List<AddressEntity> addresses;
  final String businessName; // ✅ صحح التهجئة هنا

  SellerEntity({
    required this.name,
    required this.mobile,
    required this.mail,
    required this.bankAccountNumber,
    required this.bankAccountHolderName,
    required this.TIN,
    required this.swiftCode,
    required this.logo,
    required this.banner,
    required this.addresses,
    required this.businessName, // ✅ صحح التهجئة هنا
  });
}
