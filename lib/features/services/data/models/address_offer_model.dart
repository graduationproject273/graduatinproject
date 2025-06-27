import 'package:gradution/features/services/domain/entities/address_entity.dart';

class AddressOfferModel extends AddressOfferEntity {
  AddressOfferModel({
    required super.city,
    required super.state,
    required super.street,
    required super.zipcode,
  });

  factory AddressOfferModel.fromJson(Map<String, dynamic> json) {
    return AddressOfferModel(
      city: json['city'],
      state: json['state'],
      street: json['street'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'state': state,
      'street': street,
      'zipcode': zipcode,
    };
  }
}
