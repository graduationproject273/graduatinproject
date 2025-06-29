import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/features/ai/data/models/ocr_model.dart';
import 'package:gradution/features/ai/data/models/room_analysis.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';
import 'package:gradution/features/ai/domain/services/ocr_service.dart';

class OcrImpl implements OcrService {
  final DioConsumer dioConsumer;

  OcrImpl({required this.dioConsumer});

  @override
  Future<OcrResult> uploadImageForOcr(File imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      final result = await dioConsumer.post(
        path: "http://10.0.2.2:8080/ai/upload/ocr-match",
        data: formData,
        isFormData: true,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (result.isRight()) {
        final response = result.getOrElse(() => throw Exception('No response'));
        if (response.statusCode == 200 && response.data['matches'] != null) {
          final List<dynamic> matches = response.data['matches'];

          List<ProductEntity> products = matches.map((match) {
            final productJson = match['product'];
            final categoryJson = productJson['category'];
            final sellerJson = productJson['seller'];

            return ProductEntity(
              id: _toInt(productJson['id']),
              name: productJson['name'] ?? '',
              price: _toInt(productJson['price']),
              sellingPrice: _toInt(productJson['sellingPrice']),
              image: productJson['image'] ?? '',
              description: productJson['description'] ?? '',
              quantityAvailable: _toInt(productJson['quantityAvailable']),
              specialOffer: productJson['specialOffer'] ?? false,
              hardwareSpecifications: productJson['hardwareSpecifications'] ?? '',
              discountPrice: _toInt(productJson['discountPrice'] ?? 0),
              category: CategoryEntity(
                id: _toInt(categoryJson['id']),
                name: categoryJson['name'] ?? '',
                description: categoryJson['description'] ?? '',
                image: categoryJson['image'] ?? '',
              ),
              seller: SellerEntity(
                id: _toInt(sellerJson['id']),
                name: sellerJson['name'] ?? '',
                mobile: sellerJson['mobile'] ?? '',
                mail: sellerJson['mail'] ?? '',
                bankAccountNumber: sellerJson['bankAccountNumber'] ?? '',
                bankAccountHolderName: sellerJson['bankAccountHolderName'] ?? '',
                swiftCode: sellerJson['swiftCode'] ?? '',
                tin: sellerJson['tin'] ?? '',
              ),
              isAddedToCart: false,
            );
          }).toList();

          return OcrResult(success: true, products: products);
        } else {
          return OcrResult(success: false, error: 'No matches found.');
        }
      } else {
        return OcrResult(success: false, error: result.swap().getOrElse(() => 'Unknown error'));
      }
    } catch (e) {
      return OcrResult(success: false, error: e.toString());
    }
  }

  @override
  Future<RoomAnalysisModel> uploadanalysesimage(File imageFile) async { // تغيير النوع هنا
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      final result = await dioConsumer.post(
        path: "http://10.0.2.2:8080/ai/upload/analyze-image",
        data: formData,
        isFormData: true,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (result.isRight()) {
        final response = result.getOrElse(() => throw Exception('No response'));
        if (response.statusCode == 200) {
          final data = response.data;
          return RoomAnalysisModel.fromJson(data); // تغيير هنا
        } else {
          throw Exception('Invalid status code: ${response.statusCode}');
        }
      } else {
        throw Exception(result.swap().getOrElse(() => 'Unknown error'));
      }
    } catch (e) {
      rethrow;
    }
  }

  // Helper method to safely convert dynamic values to int
  int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}