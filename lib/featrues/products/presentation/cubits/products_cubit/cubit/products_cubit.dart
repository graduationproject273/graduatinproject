// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:gradution/featrues/products/domain/entities/products_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
}
