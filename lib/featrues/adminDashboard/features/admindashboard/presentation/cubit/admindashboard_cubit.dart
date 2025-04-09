import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admindashboard_state.dart';

class AdmindashboardCubit extends Cubit<AdmindashboardState> {
  AdmindashboardCubit() : super(AdmindashboardInitial());
}
