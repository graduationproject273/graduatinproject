import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/orders_details_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/getorders_usecase.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/update_status_order.dart';

part 'getorders_state.dart';

class GetordersCubit extends Cubit<GetordersState> {
  final GetordersUsecase getordersUsecase;
  final UpdateStatusOrder updateStatusOrder;
  GetordersCubit(this.getordersUsecase, this.updateStatusOrder) : super(GetordersInitial());

  Future<void> getorders() async {
    emit(GetordersLoading());
    final result = await getordersUsecase.call();
    result.fold((l) => emit(GetordersError(l.errMessage)), (r) => emit(GetordersLoaded(r)));
  }

Future<void> changeStatusOrder(int id, String status) async {
  final result = await updateStatusOrder.call(id, status);
  result.fold(
    (l) => emit(GetordersError(l.errMessage)),
    (r) => emit(ChangeStatus(status)),
  );
}
}
