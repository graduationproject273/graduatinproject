import 'package:gradution/features/sellerDashboard/domain/entities/seller_entity.dart';

abstract class SellerRepositry {
  Future<void> addSeller(SellerEntity sellerentity);
}
