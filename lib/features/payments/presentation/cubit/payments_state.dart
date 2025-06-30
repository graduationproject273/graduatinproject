part of 'payments_cubit.dart';

abstract class PaymentsState extends Equatable {
  const PaymentsState();

  @override
  List<Object> get props => [];
}

class PaymentsInitial extends PaymentsState {}

class PaymentsLoaded extends PaymentsState {
  final StripeSession session;

  const PaymentsLoaded(this.session);

  @override
  List<Object> get props => [session];
}


class PaymentsError extends PaymentsState {
  final String message;

  const PaymentsError({required this.message});

  @override
  List<Object> get props => [message];
}

class PaymentsLoading extends PaymentsState {}