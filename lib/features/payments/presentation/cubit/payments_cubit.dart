import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/payments/domain/entities/payment_entity.dart';
import 'package:gradution/features/payments/domain/usecases/payments_usecase.dart';

part 'payments_state.dart';

class PaymentsCubit extends Cubit<PaymentsState> {
  final PaymentsUsecase paymentsUsecase;
  PaymentsCubit(this.paymentsUsecase) : super(PaymentsInitial());
  Future<void> createCheckoutSession({
    required int amount,
    required int orderId,
    required String currency,
  }) async {
    emit(PaymentsLoading());
    try {
      final session = await paymentsUsecase.createCheckoutSession(
        amount: amount,
        orderId: orderId,
        currency: currency,
      );
      emit(PaymentsLoaded(session));
    } catch (e) {
      emit(PaymentsError(message: e.toString()));
    }
  }

}
