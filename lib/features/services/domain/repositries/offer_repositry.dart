import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/services/domain/entities/offer_entity.dart';

abstract class OfferRepositry {
  Future<Either<Failure, OfferEntity>> addOffer(OfferEntity offerentity);
}
