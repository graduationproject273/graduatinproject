import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';

class OcrResult {
  final bool success;
  final List<ProductEntity>? products;
  final String? extractedText; // for consistency
  final String? error;
 final int? requestedQuantity; // 🆕 مضاف
  OcrResult({
    required this.success,
    this.products,
    this.extractedText,
    this.error,
    this.requestedQuantity ,
  });
}
