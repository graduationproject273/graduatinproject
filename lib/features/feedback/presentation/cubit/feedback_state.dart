part of 'feedback_cubit.dart';

abstract class FeedbackState extends Equatable {
  const FeedbackState();

  @override
  List<Object> get props => [];
}

class FeedbackInitial extends FeedbackState {}
class FeedbackLoading extends FeedbackState {}
class FeedbackSent extends FeedbackState {}
class FeedbackLoaded extends FeedbackState {
  final List<FeedbackEntity> feedbacks;
  const FeedbackLoaded(this.feedbacks);
}
class FeedbackError extends FeedbackState {
  final String message;
  const FeedbackError(this.message);
}
