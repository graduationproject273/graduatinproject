import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/ai/data/models/recomedmodel.dart';
import 'package:gradution/features/ai/data/models/room_analysis.dart';
import 'package:gradution/features/ai/data/models/ocr_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gradution/features/ai/domain/services/ocr_service.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_state.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';

enum ImageProcessType { ocr, analysis }

class OcrCubit extends Cubit<OcrState> {
  final OcrService _ocrService;
  final CartCubit _cartCubit;
  final ImagePicker _imagePicker = ImagePicker();
  List<ProductEntity> _currentProducts = [];
  List<RecommendationModel> _currentRecommendations = [];
  OcrResult? _currentOcrResult;
  RoomAnalysisModel? _currentAnalysis;
  ImageProcessType selectedProcessType = ImageProcessType.ocr;

  OcrCubit(this._ocrService, this._cartCubit) : super(OcrInitial());

  void setProcessType(ImageProcessType type) {
    selectedProcessType = type;
    emit(OcrInitial());
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        await _handleProcess(file);
      }
    } catch (e) {
      emit(OcrError('Failed to pick image: $e'));
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        await _handleProcess(file);
      }
    } catch (e) {
      emit(OcrError('Failed to capture image: $e'));
    }
  }

  Future<void> _handleProcess(File file) async {
    if (selectedProcessType == ImageProcessType.ocr) {
      await _processImage(file);
    } else {
      await analyzeImageAndGetRecommendations(file);
    }
  }

  Future<void> _processImage(File imageFile) async {
    emit(OcrLoading());
    try {
      final result = await _ocrService.uploadImageForOcr(imageFile);
      if (result.success) {
        _currentProducts = result.products!;
        _currentOcrResult = result;
        emit(OcrSuccess(
          result.extractedText ?? '', 
          _currentProducts, 
          result
        ));
      } else {
        emit(OcrError(result.error ?? 'Failed to process image'));
      }
    } catch (e) {
      emit(OcrError('Processing failed: $e'));
    }
  }

  Future<void> analyzeImageAndGetRecommendations(File imageFile) async {
    emit(OcrLoading());
    try {
      final RoomAnalysisModel analysis = await _ocrService.uploadanalysesimage(imageFile);
      _currentAnalysis = analysis;
      _currentRecommendations = analysis.recommendations;
      emit(RoomAnalysisSuccess(analysis, _currentProducts));
    } catch (e) {
      emit(OcrError('Image analysis failed: $e'));
    }
  }

  // OCR Products Cart Management
  Future<void> addProductToCart(int index) async {
    if (index >= 0 && index < _currentProducts.length) {
      final product = _currentProducts[index];
      if (product.isAddedToCart || product.quantityAvailable <= 0) return;

      try {
        emit(OcrLoading()); // Show loading state
        
        final cartItem = CartEntity(productId: product.id, quantity: 1);
        await _cartCubit.addToCartSilently(cartItem);
        
        _currentProducts[index] = product.copyWith(isAddedToCart: true);
        
        emit(ProductsUpdated(
          List.from(_currentProducts), 
          _getCurrentExtractedText(),
          _currentOcrResult ?? OcrResult(success: false)
        ));
        
        emit(CartActionSuccess('${product.name} added to cart successfully!'));
        
        // Return to products state after showing success message
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (!isClosed) {
            emit(ProductsUpdated(
              List.from(_currentProducts), 
              _getCurrentExtractedText(),
              _currentOcrResult ?? OcrResult(success: false)
            ));
          }
        });
      } catch (e) {
        emit(OcrError('Failed to add ${product.name} to cart: $e'));
      }
    }
  }

  Future<void> addAllProductsToCart() async {
    if (_currentProducts.isEmpty) return;
    
    try {
      emit(OcrLoading());
      
      int addedCount = 0;
      int outOfStockCount = 0;
      int alreadyInCartCount = 0;
      
      for (int i = 0; i < _currentProducts.length; i++) {
        final product = _currentProducts[i];
        
        if (product.isAddedToCart) {
          alreadyInCartCount++;
          continue;
        }
        
        if (product.quantityAvailable <= 0) {
          outOfStockCount++;
          continue;
        }

        final cartItem = CartEntity(productId: product.id, quantity: 1);
        await _cartCubit.addToCartSilently(cartItem);
        _currentProducts[i] = product.copyWith(isAddedToCart: true);
        addedCount++;
      }

      emit(ProductsUpdated(
        List.from(_currentProducts), 
        _getCurrentExtractedText(),
        _currentOcrResult ?? OcrResult(success: false)
      ));
      
      String message = '';
      if (addedCount > 0) {
        message += '$addedCount products added to cart successfully!';
      }
      if (alreadyInCartCount > 0) {
        if (message.isNotEmpty) message += '\n';
        message += '$alreadyInCartCount products already in cart.';
      }
      if (outOfStockCount > 0) {
        if (message.isNotEmpty) message += '\n';
        message += '$outOfStockCount products out of stock.';
      }
      if (message.isEmpty) {
        message = 'No products to add to cart!';
      }
      
      emit(CartActionSuccess(message));

      Future.delayed(const Duration(milliseconds: 2000), () {
        if (!isClosed) {
          emit(ProductsUpdated(
            List.from(_currentProducts), 
            _getCurrentExtractedText(),
            _currentOcrResult ?? OcrResult(success: false)
          ));
        }
      });
    } catch (e) {
      emit(OcrError('Failed to add products to cart: $e'));
    }
  }

  Future<void> removeProductFromCart(int index) async {
    if (index >= 0 && index < _currentProducts.length) {
      final product = _currentProducts[index];
      if (!product.isAddedToCart) return;

      try {
        // Remove from cart using CartCubit
        await _cartCubit.clearItemCart(product.id);
        
        _currentProducts[index] = product.copyWith(isAddedToCart: false);
        emit(ProductsUpdated(
          List.from(_currentProducts), 
          _getCurrentExtractedText(),
          _currentOcrResult ?? OcrResult(success: false)
        ));
        
        emit(CartActionSuccess('${product.name} removed from cart!'));
        
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (!isClosed) {
            emit(ProductsUpdated(
              List.from(_currentProducts), 
              _getCurrentExtractedText(),
              _currentOcrResult ?? OcrResult(success: false)
            ));
          }
        });
      } catch (e) {
        emit(OcrError('Failed to remove ${product.name} from cart: $e'));
      }
    }
  }

  Future<void> toggleProductInCart(int index) async {
    if (index >= 0 && index < _currentProducts.length) {
      final product = _currentProducts[index];
      if (product.isAddedToCart) {
        await removeProductFromCart(index);
      } else {
        await addProductToCart(index);
      }
    }
  }

  // Room Analysis Recommendations Cart Management
  Future<void> addRecommendationToCart(int index) async {
    if (index >= 0 && index < _currentRecommendations.length) {
      final recommendation = _currentRecommendations[index];
      
      try {
        emit(OcrLoading());
        
        final cartItem = CartEntity(productId: recommendation.id, quantity: 1);
        await _cartCubit.addToCartSilently(cartItem);
        
        // Update recommendation status
        _currentRecommendations[index] = recommendation.copyWith(isAddedToCart: true);
        
        // Update analysis with new recommendations
        if (_currentAnalysis != null) {
          final updatedAnalysis = _currentAnalysis!.copyWith(
            recommendations: List.from(_currentRecommendations)
          );
          
          emit(RoomAnalysisSuccess(updatedAnalysis, _currentProducts));
          emit(CartActionSuccess('${recommendation.name} added to cart successfully!'));
          
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (!isClosed) {
              emit(RoomAnalysisSuccess(updatedAnalysis, _currentProducts));
            }
          });
        }
      } catch (e) {
        emit(OcrError('Failed to add ${recommendation.name} to cart: $e'));
      }
    }
  }

  Future<void> addAllRecommendationsToCart() async {
    if (_currentRecommendations.isEmpty) return;
    
    try {
      emit(OcrLoading());
      
      int addedCount = 0;
      int alreadyInCartCount = 0;
      
      for (int i = 0; i < _currentRecommendations.length; i++) {
        final recommendation = _currentRecommendations[i];
        
        if (recommendation.isAddedToCart) {
          alreadyInCartCount++;
          continue;
        }

        final cartItem = CartEntity(productId: recommendation.id, quantity: 1);
        await _cartCubit.addToCartSilently(cartItem);
        _currentRecommendations[i] = recommendation.copyWith(isAddedToCart: true);
        addedCount++;
      }

      if (_currentAnalysis != null) {
        final updatedAnalysis = _currentAnalysis!.copyWith(
          recommendations: List.from(_currentRecommendations)
        );
        
        emit(RoomAnalysisSuccess(updatedAnalysis, _currentProducts));
        
        String message = '';
        if (addedCount > 0) {
          message = '$addedCount recommendations added to cart successfully!';
        }
        if (alreadyInCartCount > 0) {
          if (message.isNotEmpty) message += '\n';
          message += '$alreadyInCartCount recommendations already in cart.';
        }
        if (message.isEmpty) {
          message = 'All recommendations are already in cart!';
        }
        
        emit(CartActionSuccess(message));

        Future.delayed(const Duration(milliseconds: 2000), () {
          if (!isClosed) {
            emit(RoomAnalysisSuccess(updatedAnalysis, _currentProducts));
          }
        });
      }
    } catch (e) {
      emit(OcrError('Failed to add recommendations to cart: $e'));
    }
  }

  void removeAllFromCart() {
    _currentProducts = _currentProducts.map((p) => p.copyWith(isAddedToCart: false)).toList();
    _currentRecommendations = _currentRecommendations.map((r) => r.copyWith(isAddedToCart: false)).toList();
    
    if (_currentOcrResult != null) {
      emit(ProductsUpdated(
        List.from(_currentProducts), 
        _getCurrentExtractedText(),
        _currentOcrResult!
      ));
    } else if (_currentAnalysis != null) {
      final updatedAnalysis = _currentAnalysis!.copyWith(
        recommendations: List.from(_currentRecommendations)
      );
      emit(RoomAnalysisSuccess(updatedAnalysis, _currentProducts));
    }
  }

  String _getCurrentExtractedText() {
    if (state is OcrSuccess) return (state as OcrSuccess).extractedText;
    if (state is ProductsUpdated) return (state as ProductsUpdated).extractedText;
    return '';
  }

  int? getCurrentRequestedQuantity() {
    return _currentOcrResult?.requestedQuantity;
  }

  int? get requestedQuantity {
    if (state is OcrSuccess) {
      return (state as OcrSuccess).ocrResult.requestedQuantity;
    }
    if (state is ProductsUpdated) {
      return (state as ProductsUpdated).ocrResult.requestedQuantity;
    }
    return _currentOcrResult?.requestedQuantity;
  }

  List<ProductEntity> getCartItems() {
    return _currentProducts.where((p) => p.isAddedToCart).toList();
  }

  List< RecommendationModel> getCartRecommendations() {
    return _currentRecommendations.where((r) => r.isAddedToCart).toList();
  }

  int getCartItemsCount() {
    final productsCount = _currentProducts.where((p) => p.isAddedToCart).length;
    final recommendationsCount = _currentRecommendations.where((r) => r.isAddedToCart).length;
    return productsCount + recommendationsCount;
  }

  // Check if a specific product is in cart
  bool isProductInCart(String productId) {
    return _currentProducts.any((p) => p.id == productId && p.isAddedToCart) ||
           _currentRecommendations.any((r) => r.id == productId && r.isAddedToCart);
  }

  void reset() {
    _currentProducts.clear();
    _currentRecommendations.clear();
    _currentOcrResult = null;
    _currentAnalysis = null;
    emit(OcrInitial());
  }
}