import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';
import 'package:gradution/features/orders/domain/usecases/get_all_order.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  GetAllOrder getAllOrder;
  OrdersCubit(this.getAllOrder) : super(OrdersInitial());
  Future<void> getAllOrders() async {
    emit(OrdersLoading());
    final result = await getAllOrder.call();
    result.fold(
      (failure) => emit(OrdersError( failure.errMessage)),
      (orders) => emit(OrdersLoaded( orders)),
    );
  }

}
