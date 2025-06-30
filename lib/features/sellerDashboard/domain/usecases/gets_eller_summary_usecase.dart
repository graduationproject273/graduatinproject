import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/seller_summary_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class GetsEllerSummaryUsecase {
  final SellerRepositry sellerRepositry;

  GetsEllerSummaryUsecase(this.sellerRepositry);

  Future<Either<Failure, SellerSummaryEntity>> call() async {
    return await sellerRepositry.getsellerSummary();
  }
}