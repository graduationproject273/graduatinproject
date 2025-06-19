import 'package:dartz/dartz.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/checkout/data/item_oreder_model.dart';
import 'package:gradution/features/checkout/domain/repostries/checkout_repositry.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';

class CheckoutUsecase {
  final CheckoutRepositry checkoutRepo;
  CheckoutUsecase(this.checkoutRepo);

  Future<Either<Failure, OrderEntity>> call({
    required String paymentMethod,
    required String shippingAddress,
    required List<ItemOrderModel> items,
  }) async =>
      checkoutRepo
          .createOrder(paymentMethod: paymentMethod, shippingAddress: shippingAddress, items: items);
}
