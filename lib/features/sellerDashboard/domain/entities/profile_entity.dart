class ProfileEntity {
  final int id;
  final String name;
  final String businessName;
  final String mobile;
  final String mail;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final String swiftCode;
  final String logo;
  final String banner;
  final String tin;
  final UserEntity user;

  ProfileEntity({
    required this.id,
    required this.name,
    required this.businessName,
    required this.mobile,
    required this.mail,
    required this.bankAccountNumber,
    required this.bankAccountHolderName,
    required this.swiftCode,
    required this.logo,
    required this.banner,
    required this.tin,
    required this.user,
  });
}

class UserEntity {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  final bool enabled;

  UserEntity({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.enabled,
  });
}
