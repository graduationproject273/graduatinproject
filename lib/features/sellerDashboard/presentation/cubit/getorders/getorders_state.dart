part of 'getorders_cubit.dart';

sealed class GetordersState extends Equatable {
  const GetordersState();

  @override
  List<Object> get props => [];
}

final class GetordersInitial extends GetordersState {}

final class GetordersLoading extends GetordersState {}

final class GetordersLoaded extends GetordersState {
  final List<OrdersDetailsEntity> ordersList;
  const GetordersLoaded(this.ordersList);
}

final class GetordersError extends GetordersState {
  final String errMessage;
  const GetordersError(this.errMessage);
}

final class ChangeStatus extends GetordersState {
  final String status;
  const ChangeStatus(this.status);
}
