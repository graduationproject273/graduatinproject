import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/services/domain/entities/offer_entity.dart';
import 'package:gradution/features/services/domain/repositries/offer_repositry.dart';

class OfferUsecase {
  final OfferRepositry offerRepositry;

  OfferUsecase({required this.offerRepositry});

  Future<Either<Failure, OfferEntity>> addOffer(OfferEntity offerEntity) {
    return offerRepositry.addOffer(offerEntity);
  }
}