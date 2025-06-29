// Add this to your existing ai_state.dart file

import 'package:equatable/equatable.dart';
import 'package:gradution/features/ai/data/models/ocr_model.dart';
import 'package:gradution/features/ai/data/models/recomedmodel.dart';
import 'package:gradution/features/ai/data/models/room_analysis.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';

abstract class OcrState extends Equatable {
  const OcrState();

  @override
  List<Object?> get props => [];
}

class OcrInitial extends OcrState {}

class OcrLoading extends OcrState {}

class OcrSuccess extends OcrState {
  final String extractedText;
  final List<ProductEntity> products;
  final OcrResult ocrResult; // Added to hold the OCR result

  const OcrSuccess(this.extractedText, this.products, this.ocrResult);

  @override
  List<Object?> get props => [extractedText, products];
}

class ProductsUpdated extends OcrState {
  final List<ProductEntity> products;
  final String extractedText;
final OcrResult ocrResult;
  const ProductsUpdated(this.products, this.extractedText, this.ocrResult);

  @override
  List<Object?> get props => [products, extractedText];
}

class OcrError extends OcrState {
  final String message;

  const OcrError(this.message);

  @override
  List<Object?> get props => [message];
}

// New state for cart action success
class CartActionSuccess extends OcrState {
  final String message;

  const CartActionSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class RoomAnalysisSuccess extends OcrState {
  final RoomAnalysisModel analysis;
  final List<ProductEntity> products; // ← التوصيات كمنتجات

  const RoomAnalysisSuccess(this.analysis, this.products);

  @override
  List<Object?> get props => [analysis, products];
}

class RecomendSuccess extends OcrState {
  final RecommendationModel analysis;


  const RecomendSuccess(this.analysis);

  @override
  List<Object?> get props => [analysis];
}

class ImageValidationError extends OcrState {
  final String message;

  const ImageValidationError(this.message);

  @override
  List<Object?> get props => [message];
}