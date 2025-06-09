
import 'package:gradution/features/products/domain/entities/sub_entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.zip,
    required super.city,
    required super.state,
    required super.street,
    required super.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        zip: json['zip'],
        city: json['city'],
        state: json['state'],
        street: json['street'],
        country: json['country'],
      );

       Map<String, dynamic> toJson() => {
    'zip': zip,
    'city': city,
    'state': state,
    'street': street,
    'country': country,
  };
}