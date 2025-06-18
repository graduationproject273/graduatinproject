import 'package:gradution/features/sellerDashboard/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required super.name,
    required super.businessName,
    required super.mobile,
    required super.mail,
    required super.bankAccountNumber,
    required super.bankAccountHolderName,
    required super.swiftCode,
    required super.logo,
    required super.banner,
    required super.tin,
    required super.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      businessName: json['businessName'] ?? '',
      mobile: json['mobile'] ?? '',
      mail: json['mail'] ?? '',
      bankAccountNumber: json['bankAccountNumber'] ?? '',
      bankAccountHolderName: json['bankAccountHolderName'] ?? '',
      swiftCode: json['swiftCode'] ?? '',
      logo: json['logo'] ?? '',
      banner: json['banner'] ?? '',
      tin: json['tin'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'businessName': businessName,
      'mobile': mobile,
      'mail': mail,
      'bankAccountNumber': bankAccountNumber,
      'bankAccountHolderName': bankAccountHolderName,
      'swiftCode': swiftCode,
      'logo': logo,
      'banner': banner,
      'tin': tin,
      'user': (user as UserModel).toJson(),
    };
  }
}

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstname,
    required super.lastname,
    required super.email,
    required super.username,
    required super.enabled,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      enabled: json['enabled'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'username': username,
      'enabled': enabled,
    };
  }
}
