import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/seller_usecase.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/seller_entity.dart';

part 'seller_state.dart';

class SellerCubit extends Cubit<SellerState> {
  final SellerUsecase sellerUsecase;
  SellerCubit( this.sellerUsecase) : super(SellerInitial());
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final bankAccountNumberController = TextEditingController();
    final TINController = TextEditingController();
      final bankAccountHolderNameController = TextEditingController();
  final swiftCodeController = TextEditingController();
  final logoController = TextEditingController();
  final bannerController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final bussinessNameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> signupSeller(SellerEntity seller) async {
    emit(SellerLoading());
    final result = await sellerUsecase.signupSeller(seller);
    result.fold(
      (failure) => emit(SellerError(failure.errMessage)),
      (sellerEntity) => emit(SellerSuccess(sellerEntity)),
    );
  }
}
