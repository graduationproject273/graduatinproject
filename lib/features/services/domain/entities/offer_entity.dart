 import 'package:gradution/features/services/domain/entities/address_entity.dart';
import 'package:gradution/features/services/domain/entities/optional_offer_entity.dart';

class OfferEntity {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final AddressOfferEntity address;
  final String requirements;
  final String homeType;
  final String homeStatus;
  final int homeSize;
  final int numberOfLevels;
  final int numberOfRooms;
  final DateTime installationDate;
  final List<String> smartSensors;
  final OptionalFeaturesEntity optionalFeatures;

  OfferEntity({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.address,
    required this.requirements,
    required this.homeType,
    required this.homeStatus,
    required this.homeSize,
    required this.numberOfLevels,
    required this.numberOfRooms,
    required this.installationDate,
    required this.smartSensors,
    required this.optionalFeatures,
  });
}
