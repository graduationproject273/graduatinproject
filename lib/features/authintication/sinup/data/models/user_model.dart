// UserModel.dart
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.password,
    super.token,
    super.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      // Add null checks and provide default values
      email: json['email']?.toString() ?? '',
      password: '', // السيرفر مش بيرجع الباسورد
      token: json['token']?.toString(),
      roles: json['roles'] != null
          ? List<String>.from(
              json['roles'].map((role) => role?.toString() ?? ''))
          : [],
    );
  }

  // إضافة الـ fromEntity method
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      email: entity.email,
      password: entity.password,
      token: entity.token,
      roles: entity.roles,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  // إضافة method للتحويل لـ Map شامل (مع الـ token والـ roles)
  Map<String, dynamic> toFullJson() {
    return {
      'email': email,
      'password': password,
      'token': token,
      'roles': roles,
    };
  }
}
