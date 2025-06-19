import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gradution/features/checkout/domain/usecases/checkout_usecase.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutUsecase checkoutUsecase;
  CheckoutCubit(this.checkoutUsecase) : super(CheckoutInitial());

  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final addressController = TextEditingController(); // ✅ أضف هذا

  String paymentMethod = 'cash';
  bool saveAddress = false; // ✅ اختياري لو حبيت تحفط العنوان

  void setPaymentMethod(String method) {
    paymentMethod = method;
    emit(CheckoutPaymentMethodChanged(method));
  }

  void toggleSaveAddress(bool value) {
    saveAddress = value;
    emit(CheckoutAddressSavedToggled(value)); // حالة لتحديث واجهة الحفظ
  }

  Future<void> checkout({
    required String paymentMethod,
    required String shippingAddress,
    required List<Map<String, dynamic>> items,
  }) async {
    emit(CheckoutLoading());

    final failureOrOrder = await checkoutUsecase.call(
      paymentMethod: paymentMethod,
      shippingAddress: shippingAddress,
      items: items,
    );

    failureOrOrder.fold(
      (failure) => emit(CheckoutError(failure.errMessage)),
      (order) => emit(CheckoutSuccess()),
    );
  }
}
