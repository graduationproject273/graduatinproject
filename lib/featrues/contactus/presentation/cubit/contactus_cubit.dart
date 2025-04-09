// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'contactus_state.dart';

class ContactusCubit extends Cubit<ContactusState> {
  ContactusCubit() : super(ContactusInitial());
}
