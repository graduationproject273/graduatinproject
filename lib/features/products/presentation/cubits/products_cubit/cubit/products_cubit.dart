// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/products/domain/usecases/get_all_product.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProduct getAllProduct;  
  ProductsCubit(this.getAllProduct) : super(ProductsInitial());

 
  Future<void> getProduct (String endPoint)async{
  try {
    emit(ProductsLoading());
      final result = await getAllProduct.call(     endPoint);
      result.fold(
        (C) => emit(ProductsError(
            "❗$C ")),
        (success) => emit(ProductsLoaded(success)),
      );
    } catch (e) {
      emit(ProductsError(
          '❗ $e '));
    }
  }
  getProductById(int id)async{
    try {
      emit(ProductsLoading());
      final result = await getAllProduct.call(EndPoints.getProductByCategoryId(id));
      result.fold(
        (C) => emit(ProductsError(
            "❗$C ")),
        (success) => emit(ProductsLoaded(success)),
      );
    } catch (e) {
      emit(ProductsError(
          '❗ $e '));
    }
  }
}
