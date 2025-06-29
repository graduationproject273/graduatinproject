import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gradution/features/feedback/data/models/send_feedback.dart';
import 'package:gradution/features/feedback/domain/entities/feedback_entity.dart';
import 'package:gradution/features/feedback/domain/usecases/feedback_usecase.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  final FeedbackUsecase feedbackUsecase;
  
  FeedbackCubit(this.feedbackUsecase) : super(FeedbackInitial());
  Future<void> sendFeedback({required FeedbackSimpleModel feedback, required int productId}) async {
    emit(FeedbackLoading());
    final result = await feedbackUsecase.sendFeedback(feedback: feedback, productid: productId);
    
    result.fold(
      (failure) => emit(FeedbackError(failure.errMessage)),
      (_) => emit(FeedbackSent()),
    );
  }
  Future<void> getFeedbacksByProductId(int productId) async {
    emit(FeedbackLoading());
    final result = await feedbackUsecase.getFeedbacksByProductId(productId);
    
    result.fold(
      (failure) => emit(FeedbackError(failure.errMessage)),
      (r) => emit(FeedbackLoaded( r)),//.map((item) => FeedbackModel.fromJson(item)).toList()),
    );
  }


}
