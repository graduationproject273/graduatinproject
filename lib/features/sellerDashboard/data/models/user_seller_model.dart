import 'package:gradution/features/sellerDashboard/domain/entities/user_seller_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstname,
    required super.lastname,
    required super.email,
    super.mobile,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      mobile: json['mobile'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'mobile': mobile,
      'role': role,
    };
  }
}
