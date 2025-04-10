import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'typeuser_state.dart';

class TypeuserCubit extends Cubit<TypeuserState> {
  TypeuserCubit() : super(TypeuserInitial());
}
