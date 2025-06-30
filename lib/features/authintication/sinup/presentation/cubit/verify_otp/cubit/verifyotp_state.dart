part of 'verifyotp_cubit.dart';

sealed class VerifyotpState extends Equatable {
  const VerifyotpState();

  @override
  List<Object> get props => [];
}

final class VerifyotpInitial extends VerifyotpState {}

final class VerifyotpLoading extends VerifyotpState {}
final class VerifyotpSuccess extends VerifyotpState {
  final UserEntity userEntity;

  const VerifyotpSuccess({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}
final class VerifyotpError extends VerifyotpState {
  final String error;

  const VerifyotpError({required this.error});

  @override
  List<Object> get props => [error];
}
