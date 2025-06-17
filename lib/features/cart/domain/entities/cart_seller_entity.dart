import 'package:gradution/features/authintication/sinup/data/models/user_model.dart';

class CartSellerEntity {
  final int id;
  final String name;
  final String? businessName;
  final String? mobile;
  final String? mail;
  final String? bankAccountNumber;
  final String? bankAccountHolderName;
  final String? swiftCode;
  final String? logo;
  final String? banner;
  final String? status;
  final String? address;
  final String? tin;
  final UserModel? user;

  CartSellerEntity({
    required this.id,
    required this.name,
    this.businessName,
    this.mobile,
    this.mail,
    this.bankAccountNumber,
    this.bankAccountHolderName,
    this.swiftCode,
    this.logo,
    this.banner,
    this.status,
    this.address,
    this.tin,
    this.user,
  });
}