import 'package:gradution/features/cart/domain/entities/prdouct_cart_entity.dart';

class CartItemEntity {
  final int id;
  final PrdouctCartEntity productcartentity;
  final int quantity;

  CartItemEntity({
    required this.id,
    required this.productcartentity,
    required this.quantity,
  });
}
