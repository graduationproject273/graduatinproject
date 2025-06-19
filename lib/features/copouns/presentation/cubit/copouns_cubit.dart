import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'copouns_state.dart';

class CopounsCubit extends Cubit<CopounsState> {
  CopounsCubit() : super(CopounsInitial());
}
