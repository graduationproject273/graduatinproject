import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gradution/features/services/domain/entities/offer_entity.dart';
import 'package:gradution/features/services/domain/usecases/offer_usecase.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final OfferUsecase offerUsecase;
  ServicesCubit(this.offerUsecase) : super(ServicesInitial());

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController homeTypeController = TextEditingController();
  final TextEditingController homeStatusController = TextEditingController();
  final TextEditingController homeSizeController = TextEditingController();
  final TextEditingController numberOfLevelsController = TextEditingController();
  final TextEditingController numberOfRoomsController = TextEditingController();
  final TextEditingController installationDateController = TextEditingController();

  List<String> smartSensors = [];
  Map<String, String> optionalFeatures = {};

  String selectedHomeType = '';
  String selectedHomeStatus = '';
  String selectedHomeSize = '';
  DateTime? selectedInstallationDate;

  void updateHomeType(String? val) {
    selectedHomeType = val ?? '';
    // إضافة timestamp لضمان التحديث
    emit(ServicesUpdated(timestamp: DateTime.now().millisecondsSinceEpoch));
  }

  void updateHomeStatus(String? val) {
    selectedHomeStatus = val ?? '';
    emit(ServicesUpdated(timestamp: DateTime.now().millisecondsSinceEpoch));
  }

  void updateHomeSize(String? val) {
    selectedHomeSize = val ?? '';
    emit(ServicesUpdated(timestamp: DateTime.now().millisecondsSinceEpoch));
  }

  void updateInstallationDate(DateTime date) {
    selectedInstallationDate = date;
    installationDateController.text = date.toIso8601String();
    emit(ServicesUpdated(timestamp: DateTime.now().millisecondsSinceEpoch));
  }

  Future<void> addOffer(OfferEntity offerEntity) async {
    emit(ServicesLoading());
    final result = await offerUsecase.addOffer(offerEntity);
    result.fold(
      (failure) => emit(ServicesError()),
      (offer) => emit(ServicesLoaded(offers: offer)),
    );
  }
}