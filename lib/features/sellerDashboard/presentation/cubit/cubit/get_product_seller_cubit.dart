import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/products/domain/usecases/get_all_product.dart';

part 'get_product_seller_state.dart';

class GetProductSellerCubit extends Cubit<GetProductSellerState> {
  final GetAllProduct getAllProduct;
  GetProductSellerCubit(this.getAllProduct) : super(GetProductSellerInitial());

   Future<void> getAllcategoryfunction ()async{
  try {
      final result = await getAllProduct.call();
      result.fold(
        (C) => emit(GetAllProductError(
            "❗$C ")),
        (success) => emit(GetProductSellerSuccess(success)),
      );
    } catch (e) {
      emit(GetAllProductError(
          '❗ $e '));
    }
  }
}
