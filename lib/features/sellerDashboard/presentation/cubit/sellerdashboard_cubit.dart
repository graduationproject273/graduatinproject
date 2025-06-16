// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';

part 'sellerdashboard_state.dart';

class SellerdashboardCubit extends Cubit<SellerdashboardState> {
  SellerdashboardCubit() : super(SellerdashboardInitial());



final cloudinary = CloudinaryPublic(
  'doilrq33o', // ← cloud name
  'EZsmart',   // ← upload preset
  cache: false,
);

Future<void> pickAndUploadImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile == null) {
    print('❌ No image selected.');
    return;
  }

  try {
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        pickedFile.path,
        resourceType: CloudinaryResourceType.Image,
      ),
    );

    print('✅ Uploaded to: ${response.secureUrl}');
  } on CloudinaryException catch (e) {
    print('❌ Cloudinary error: ${e.message}');
    print('Request details: ${e.request}');
  }
}

  
}
