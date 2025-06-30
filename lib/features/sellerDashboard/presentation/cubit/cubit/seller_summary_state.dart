part of 'seller_summary_cubit.dart';

sealed class SellerSummaryState extends Equatable {
  const SellerSummaryState();

  @override
  List<Object> get props => [];
}

final class SellerSummaryInitial extends SellerSummaryState {}
final class SellerSummaryLoading extends SellerSummaryState {}
final class SellerSummaryLoaded extends SellerSummaryState {
  final SellerSummaryEntity sellerSummary;
  const SellerSummaryLoaded(this.sellerSummary);
}
final class SellerSummaryError extends SellerSummaryState {
  final String message;
  const SellerSummaryError(this.message);
}