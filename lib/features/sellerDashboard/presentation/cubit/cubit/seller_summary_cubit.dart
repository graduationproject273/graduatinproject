import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/seller_summary_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/gets_eller_summary_usecase.dart';

part 'seller_summary_state.dart';

class SellerSummaryCubit extends Cubit<SellerSummaryState> {
  final GetsEllerSummaryUsecase getsellerSummaryUsecase;
  SellerSummaryCubit(this.getsellerSummaryUsecase) : super(SellerSummaryInitial());

  Future<void> getsellerSummary() async {
    emit(SellerSummaryLoading());
    final result = await getsellerSummaryUsecase.call();
    result.fold((l) => emit(SellerSummaryError(l.errMessage.toString())), (r) => emit(SellerSummaryLoaded(r)));
  }
}
