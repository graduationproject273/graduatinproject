import 'package:dartz/dartz.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/services/data/models/offer_model.dart';
import 'package:gradution/features/services/domain/entities/offer_entity.dart';
import 'package:gradution/features/services/domain/repositries/offer_repositry.dart';

class OfferRepositryImpl extends OfferRepositry {
  final DioConsumer dioConsumer;

  OfferRepositryImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, OfferEntity>> addOffer(OfferEntity offerentity) async {
    try {
      final result = await dioConsumer.post(
        path: EndPoints.offers,
       data: OfferModel(
  firstName: offerentity.firstName,
  lastName: offerentity.lastName,
  mobile: offerentity.mobile,
  email: offerentity.email,
  address: offerentity.address,
  requirements: offerentity.requirements,
  homeType: offerentity.homeType,
  homeStatus: offerentity.homeStatus,
  homeSize: offerentity.homeSize,
  numberOfLevels: offerentity.numberOfLevels,
  numberOfRooms: offerentity.numberOfRooms,
  installationDate: offerentity.installationDate,
  smartSensors: offerentity.smartSensors,
  optionalFeatures: offerentity.optionalFeatures,
).toJson(), 
      );
      return result.fold(
        (l) => Left(Failure(errMessage: l.toString())),
        (r) => Right(OfferModel.fromJson(r.data)),
      );
    } catch (e) {
      return Left(Failure( errMessage: 'Failed to add offer'));
    }
  }
}
