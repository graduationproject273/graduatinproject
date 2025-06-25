import 'package:bloc/bloc.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/get_all_category_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/addproduct_usecase.dart';
import 'package:image_picker/image_picker.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddproductUsecase addproductUsecase;
  AddProductCubit({required this.addproductUsecase})
      : super(AddProductInitial());
  String imageUrl = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController hardwareSpecificationsController =
      TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final cloudinary = CloudinaryPublic(
    'doilrq33o', // ← cloud name
    'EZsmart', // ← upload preset
    cache: false,
  );

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }

    try {
      emit(StatusLoading());
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          pickedFile.path,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
      emit(AddImage(response.secureUrl));
      print('Image uploaded successfully: ${response.secureUrl}');
    } on CloudinaryException catch (e) {
      emit(ErrorImage(e.message.toString()));
    } catch (e) {
      emit(ErrorImage('An unexpected error occurred: $e'));
    }
  }

  Future<void> addProduct(AddProductModel add) async {
    emit(AddProductLoading());
    try {
      final result = await addproductUsecase.call(add);
      print(result);
      result.fold(
        (failure) => emit(AddProductFailure("❗ ${failure.errMessage}")),
        (success) {
          emit(AddProductSuccess(success));
        },
      );
    } catch (e) {
      emit(AddProductFailure('❗$e '));
    }
  }
}
