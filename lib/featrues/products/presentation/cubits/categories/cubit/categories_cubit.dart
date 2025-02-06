import 'package:bloc/bloc.dart';
import 'package:gradution/featrues/products/domain/entities/categories_entity.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
}
