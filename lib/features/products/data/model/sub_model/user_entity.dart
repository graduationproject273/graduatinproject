import 'package:gradution/features/products/data/model/sub_model/authority_model.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/authority_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstname,
    required super.lastname,
    required super.email,
    required super.password,
    super.mobile,
    required super.role,
    required super.addresses,
    required super.enabled,
    required super.username,
    required super.credentialsNonExpired,
    required super.accountNonExpired,
    required super.authorities,
    required super.accountNonLocked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        password: json['password'],
        mobile: json['mobile'],
        role: json['role'],
        addresses: json['addresses'],
        enabled: json['enabled'],
        username: json['username'],
        credentialsNonExpired: json['credentialsNonExpired'],
        accountNonExpired: json['accountNonExpired'],
        authorities: (json['authorities'] as List)
            .map((e) => AuthorityModel.fromJson(e) as AuthorityEntity)
            .toList(),
        accountNonLocked: json['accountNonLocked'],
      );
      Map<String, dynamic> toJson() => {
    'id': id,
    'firstname': firstname,
    'lastname': lastname,
    'email': email,
    'password': password,
    'mobile': mobile,
    'role': role,
    'enabled': enabled,
    'username': username,
    'credentialsNonExpired': credentialsNonExpired,
    'accountNonExpired': accountNonExpired,
    'authorities': authorities.map((e) => (e as AuthorityModel).toJson()).toList(),
    'accountNonLocked': accountNonLocked,
  };
}