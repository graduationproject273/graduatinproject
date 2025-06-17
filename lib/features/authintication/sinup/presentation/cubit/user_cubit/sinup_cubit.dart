import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/features/authintication/sinup/data/models/user_model.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/login_usecase.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/signup_seller.dart';

part 'sinup_state.dart';

class SinupCubit extends Cubit<SinupState> {
  final SignupSellerUsecase signupSellerUsecase;
  final LoginUsecase loginUsecase;

  SinupCubit(
    this.signupSellerUsecase,
    this.loginUsecase,
  ) : super(SinupInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> signup(UserEntity user) async {
    emit(SinupLoading());

    final loginResult = await loginUsecase(user);

    await loginResult.fold(
      (l) async => emit(SinupError(l.errMessage)),
      (userModel) async {
        if (userModel.token != null) {
          await CacheHelper().saveData(
            key: 'token',
            value: userModel.token!,
          );
          emit(SinupSuccess(userModel.roles ?? []));
        } else {
          emit(SinupError('Token is null'));
        }
      },
    );
  }
}
