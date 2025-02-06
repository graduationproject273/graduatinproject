part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}
final class ReviewsSeccess extends ReviewsState {
 final List<ReviewEntitiy> reviewList;

  ReviewsSeccess({required this.reviewList});
}
final class ReviewsFailure extends ReviewsState {
  final String errorMessage;

  ReviewsFailure({required this.errorMessage});
}
final class ReviewsLoading extends ReviewsState {}