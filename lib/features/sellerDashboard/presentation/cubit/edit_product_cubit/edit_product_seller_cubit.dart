import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/edit_product.dart';

part 'edit_product_seller_state.dart';

class EditProductSellerCubit extends Cubit<EditProductSellerState> {
  EditProductSellerCubit(this.editProductSeller) : super(EditProductSellerInitial());
 final EditProduct editProductSeller;


   String imageUrl = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController hardwareSpecificationsController =TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  

  Future<void> editProduct(AddProductModel add,int id) async {
    emit(AddProductLoading());
    try {
      final result = await editProductSeller.call(add, id);
      print(result);
      result.fold(
        (failure) => emit(EditProductFailure(
            "❗ ${failure.errMessage}")),
        (success) {
          emit(EditProductSuccess(success));
        },
      );
    } catch (e) {
      emit(EditProductFailure(
          '❗$e '));
    }
  }

  
}
