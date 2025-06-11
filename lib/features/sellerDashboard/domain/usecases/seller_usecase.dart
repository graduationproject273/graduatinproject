import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class SellerUsecase {
  final SellerRepositry sellerRepositry;

  SellerUsecase({required this.sellerRepositry});

  Future<void> addSeller(sellerentity) =>
      sellerRepositry.addSeller(sellerentity);
}
