part of 'sinup_cubit.dart';

abstract class SinupState extends Equatable {
  const SinupState();

  @override
  List<Object> get props => [];
}

class SinupInitial extends SinupState {}

class SinupLoading extends SinupState {}

class SinupError extends SinupState {
  final String message;
  SinupError(this.message);
}

class SinupSuccess extends SinupState {
  final List<String> roles;
  const SinupSuccess(this.roles);

  @override
  List<Object> get props => [roles];
}
