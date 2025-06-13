import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.password, super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
