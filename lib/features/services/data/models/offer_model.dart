import 'package:gradution/features/services/data/models/address_offer_model.dart';
import 'package:gradution/features/services/domain/entities/offer_entity.dart';
import 'package:gradution/features/services/domain/entities/optional_offer_entity.dart';


class OfferModel extends OfferEntity {
  OfferModel({
    required super.firstName,
    required super.lastName,
    required super.mobile,
    required super.email,
    required super.address,
    required super.requirements,
    required super.homeType,
    required super.homeStatus,
    required super.homeSize,
    required super.numberOfLevels,
    required super.numberOfRooms,
    required super.installationDate,
    required super.smartSensors,
    required super.optionalFeatures,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobile: json['mobile'],
      email: json['email'],
      address: AddressOfferModel.fromJson(json['address']),
      requirements: json['requirements'],
      homeType: json['homeType'],
      homeStatus: json['homeStatus'],
      homeSize: json['homeSize'],
      numberOfLevels: json['numberOfLevels'],
      numberOfRooms: json['numberOfRooms'],
      installationDate: DateTime.parse(json['installationDate']),
      smartSensors: List<String>.from(json['smartSensors']),
      optionalFeatures: OptionalFeaturesModel.fromJson(json['optionalFeatures']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'email': email,
      'address': (address as AddressOfferModel).toJson(),
      'requirements': requirements,
      'homeType': homeType,
      'homeStatus': homeStatus,
      'homeSize': homeSize,
      'numberOfLevels': numberOfLevels,
      'numberOfRooms': numberOfRooms,
      'installationDate': installationDate.toIso8601String(),
      'smartSensors': smartSensors,
      'optionalFeatures': (optionalFeatures as OptionalFeaturesModel).toJson(),
    };
  }
}
