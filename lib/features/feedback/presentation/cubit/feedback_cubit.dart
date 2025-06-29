import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(FeedbackInitial());
}
