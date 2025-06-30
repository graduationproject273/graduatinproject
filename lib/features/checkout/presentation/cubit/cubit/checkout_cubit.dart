import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gradution/features/checkout/data/item_oreder_model.dart';
import 'package:gradution/features/checkout/domain/usecases/checkout_usecase.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutUsecase checkoutUsecase;
  CheckoutCubit(this.checkoutUsecase) : super(CheckoutInitial());

  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final addressController = TextEditingController();
  List<ItemOrderModel> items = [];
  String paymentMethod = 'cash';
  bool saveAddress = false;
  
  // Store the last successful order
  OrderEntity? _lastOrder;
  OrderEntity? get lastOrder => _lastOrder;
  
  // Get the last order ID safely
  int? get lastOrderId {
    if (_lastOrder?.id != null) {
      if (_lastOrder!.id is int) {
        return _lastOrder!.id as int;
      } else if (_lastOrder!.id is String) {
        return int.tryParse(_lastOrder!.id.toString());
      }
    }
    return null;
  }

  void setPaymentMethod(String value) {
    if (paymentMethod != value) {
      paymentMethod = value;
      emit(CheckoutPaymentMethodChanged(value));
    }
  }

  void toggleSaveAddress(bool value) {
    saveAddress = value;
    emit(CheckoutAddressSavedToggled(value));
  }

  Future<void> checkout({
    required String paymentMethod,
    required String shippingAddress,
    required List<ItemOrderModel> items,
  }) async {
    try {
      emit(CheckoutLoading());

      final failureOrOrder = await checkoutUsecase.call(
        paymentMethod: paymentMethod,
        shippingAddress: shippingAddress,
        items: items,
      );

      failureOrOrder.fold(
        (failure) {
          _lastOrder = null;
          emit(CheckoutError(failure.errMessage));
        },
        (order) {
          _lastOrder = order;
          emit(CheckoutSuccess(order));
        },
      );
    } catch (e) {
      _lastOrder = null;
      emit(CheckoutError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    addressController.dispose();
    return super.close();
  }
}