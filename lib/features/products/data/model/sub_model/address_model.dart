

import 'package:gradution/features/products/domain/entities/sub_entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.street,
    required super.city,
    required super.state,
    required super.zip,
    required super.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zip: json['zip'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
    };
  }
}