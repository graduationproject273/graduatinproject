
import 'package:gradution/features/products/domain/entities/sub_entities/authority_entity.dart';

class UserEntity {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String? mobile;
  final String role;
  final List<dynamic>? addresses;
  final bool enabled;
  final String username;
  final bool credentialsNonExpired;
  final bool accountNonExpired;
  final List<AuthorityEntity> authorities;
  final bool accountNonLocked;

  UserEntity({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    this.mobile,
    required this.role,
    required this.addresses,
    required this.enabled,
    required this.username,
    required this.credentialsNonExpired,
    required this.accountNonExpired,
    required this.authorities,
    required this.accountNonLocked,
  });
}



