import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/core/enums/status.dart';
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
  // أولاً: نحدّث الـ UI محليًا (Optimistic Update)
  if (state is GetordersLoaded) {
    final currentOrders = List<OrdersDetailsEntity>.from((state as GetordersLoaded).ordersList);
    final updatedOrders = currentOrders.map((order) {
      if (order.id == id) {
        return order.copyWith(
          status: OrderItemStatus.values.firstWhere((e) => e.name == status),
        );
      }
      return order;
    }).toList();

    emit(GetordersLoaded(updatedOrders)); // ✅ تحديث محلي للـ UI فقط
  }

  // ثانيًا: نبعت التغيير للـ API بدون استدعاء getorders()
  final result = await updateStatusOrder.call(id, status);
  result.fold(
    (l) {
      // في حالة الخطأ، نرجّع البيانات القديمة أو نعرض رسالة فقط
      emit(GetordersError(l.errMessage));
    },
    (r) {
      // ✅ بنعمل nothing هنا، لأننا بالفعل حدثنا الـ UI محليًا
    },
  );
}
void addOrderLocally(OrdersDetailsEntity order) {
  if (state is GetordersLoaded) {
    final currentOrders =
        List<OrdersDetailsEntity>.from((state as GetordersLoaded).ordersList);
    currentOrders.insert(0, order); // تضيف في أول القائمة
    emit(GetordersLoaded(currentOrders));
  }
}




}
