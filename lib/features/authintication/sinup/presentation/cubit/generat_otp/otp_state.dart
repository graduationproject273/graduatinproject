part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}
final class OtpLoading extends OtpState {}
final class OtpLoaded extends OtpState {}
final class OtpError extends OtpState {
  final String error;
  const OtpError( {required this.error});
}
