import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/features/authintication/sinup/domain/entities/user_entity.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/signup_usecase.dart';

part 'sinup_state.dart';

class SinupCubit extends Cubit<SinupState> {
  final SignupUsecase signupUsecase;
  SinupCubit(this.signupUsecase) : super(SinupInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> signup(UserEntity user) async {
    emit(SinupLoading());
    final result = await signupUsecase(user);
    result.fold(
      (l) => emit(SinupError(l.errMessage)),
      (r) {
        CacheHelper().saveData(key: 'token', value: r.token); // 👈 حفظ التوكن
        emit(SinupSuccess(r));
      },
    );
  }
}
