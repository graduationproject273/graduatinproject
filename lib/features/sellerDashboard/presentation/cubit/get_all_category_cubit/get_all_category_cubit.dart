import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/get_all_category_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/get_all_category.dart';

part 'get_all_category_state.dart';

class GetAllCategoryCubit extends Cubit<GetAllCategoryState> {
 final GetAllCategory getAllCategory ;
  GetAllCategoryCubit(this.getAllCategory) : super(GetAllCategoryInitial());

  Future<void> getAllcategoryfunction ()async{
  try {
      final result = await getAllCategory.call();
      result.fold(
        (C) => emit(GetAllCategoyError(
            "❗$C ")),
        (success) => emit(GetAllCategorySuccess(success)),
      );
    } catch (e) {
      emit(GetAllCategoyError(
          '❗ $e '));
    }
  }
}
