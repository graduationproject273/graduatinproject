import 'package:bloc/bloc.dart';
import 'package:gradution/featrues/products/domain/entities/products_entity.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
}
