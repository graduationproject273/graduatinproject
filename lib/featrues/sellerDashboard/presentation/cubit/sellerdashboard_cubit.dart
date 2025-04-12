import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sellerdashboard_state.dart';

class SellerdashboardCubit extends Cubit<SellerdashboardState> {
  SellerdashboardCubit() : super(SellerdashboardInitial());
}
