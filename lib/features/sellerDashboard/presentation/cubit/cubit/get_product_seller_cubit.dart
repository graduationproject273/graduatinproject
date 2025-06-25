import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/products/domain/usecases/get_all_product.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/edit_product.dart';

part 'get_product_seller_state.dart';

class GetProductSellerCubit extends Cubit<GetProductSellerState> {
  final GetAllProduct getAllProduct;
    final EditProduct edi;

  GetProductSellerCubit(this.getAllProduct, this.edi) : super(GetProductSellerInitial());

   Future<void> getAllProductfun ()async{
  try {
    emit(GetProductSellerLoading());
      final result = await getAllProduct.call(EndPoints.productsSeller);
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
 Future<void> deleteProduct(int id) async {
  try {
    final result = await edi.deleteProduct(id);
    result.fold(
      (failure) => emit(GetAllProductError("❗ ${failure.errMessage}")),
      (_) {
        removeProductLocally(id); // 👈 حذف المنتج محليًا
      },
    );
  } catch (e) {
    emit(GetAllProductError('❗$e '));
  }
}


  void removeProductLocally(int id) {
  if (state is GetProductSellerSuccess) {
    final currentList = List<ProductEntity>.from((state as GetProductSellerSuccess).products);
    currentList.removeWhere((element) => element.id == id);
    emit(GetProductSellerSuccess(currentList));
  }
}

  
}
