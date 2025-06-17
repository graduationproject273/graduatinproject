import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/usecases/cart_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartUseCase cartUseCase;
  CartCubit(this.cartUseCase) : super(CartInitial());

  Future<void> addToCart(CartItemEntity cartItem) async {
    emit(CartLoading());
    final result = await cartUseCase.addToCart(cartItem);
    result.fold(
      (failure) => emit(CartError(message: failure.errMessage)),
      (cartItem) => emit(AddtoCartLoaded(cartItem: cartItem)),
    );
  }
}
