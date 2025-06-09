
import 'package:gradution/features/products/domain/entities/sub_entities/authority_entity.dart';

class AuthorityModel extends AuthorityEntity {
  AuthorityModel({required super.authority});

  factory AuthorityModel.fromJson(Map<String, dynamic> json) =>
      AuthorityModel(authority: json['authority']);
       Map<String, dynamic> toJson() => {
    'authority': authority,
  };
}