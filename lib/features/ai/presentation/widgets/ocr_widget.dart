import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_cubit.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_state.dart';
import 'package:gradution/features/ai/presentation/widgets/add_all_recos.dart';
import 'package:gradution/features/ai/presentation/widgets/card_for_ocr.dart';
import 'package:gradution/features/ai/presentation/widgets/card_in_analyze.dart';
import 'package:gradution/features/ai/presentation/widgets/choice_between_oceandana.dart';
import 'package:gradution/features/ai/presentation/widgets/column_choices.dart';
import 'package:gradution/features/ai/presentation/widgets/custom_appbar.dart';
import 'package:gradution/features/ai/presentation/widgets/no_images_selected.dart';
import 'package:gradution/features/ai/presentation/widgets/processing_loading.dart';
import 'package:gradution/features/ai/presentation/widgets/row_carts_ai.dart';

class OcrView extends StatelessWidget {
  const OcrView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF00917C);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: OcrAppBar(),
      body: BlocListener<OcrCubit, OcrState>(
        listener: (context, state) {
          if (state is OcrError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'Dismiss',
                  textColor: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );
          } else if (state is CartActionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ChoiceBetwwenOcrandAnalyze(primaryColor: primaryColor)
              ),
              const SizedBox(height: 20),
                ColumnChoices(primaryColor: primaryColor),
              const SizedBox(height: 20),
              BlocBuilder<OcrCubit, OcrState>(builder: (context, state) {
                if (state is OcrLoading) {
                  return ProcessingLoading(primaryColor: primaryColor);
                }
                if (state is OcrSuccess || state is ProductsUpdated) {
                  final products = state is OcrSuccess
                      ? state.products
                      : (state as ProductsUpdated).products;
                  final requestedQuantity =
                      context.read<OcrCubit>().requestedQuantity;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Matched Products',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          if (requestedQuantity != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: primaryColor.withOpacity(0.3)),
                              ),
                              child: Text(
                                'Requested: $requestedQuantity',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ...products.asMap().entries.map((entry) {
                        final index = entry.key;
                        final product = entry.value;
                        final isOutOfStock = product.quantityAvailable <= 0;
                        final isInCart = product.isAddedToCart;
                        return CardForOCR(product: product, primaryColor: primaryColor, isOutOfStock: isOutOfStock, requestedQuantity: requestedQuantity, isInCart: isInCart, index: index);
                      }).toList(),
                      const SizedBox(height: 10),
                    RowCartsInai(primaryColor: primaryColor),
                    ],
                  );
                }
                if (state is RoomAnalysisSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Analysis Header
                      const Text(
                        'Room Analysis Results',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.visibility,
                                    color: primaryColor, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  'Detected Objects',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: state.analysis.detectedObjects
                                  .map(
                                    (obj) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color:
                                                primaryColor.withOpacity(0.3)),
                                      ),
                                      child: Text(
                                        obj,
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.recommend,
                                    color: primaryColor, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  'Recommendations',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  '${state.analysis.recommendations.length} items',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ...state.analysis.recommendations
                                .asMap()
                                .entries
                                .map((entry) {
                              final index = entry.key;
                              final rec = entry.value;
                              final isInCart = rec.isAddedToCart;
                              return CardInAnalyze(rec: rec, primaryColor: primaryColor, isInCart: isInCart, index: index);
                            }).toList(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                     AddAllRecos(primaryColor: primaryColor),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.analytics,
                                    color: primaryColor, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  'Analysis Image',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                           Builder(
  builder: (context) {
    String imageUrl = state.analysis.image;
    
    print('Original Image URL: $imageUrl'); // للتشخيص
    
    // تنظيف وإصلاح الـ URL
    String fixedImageUrl = imageUrl;
    
    if (imageUrl.isNotEmpty) {
      // استبدال localhost بـ IP الفعلي
      fixedImageUrl = imageUrl.replaceAll('localhost', '10.0.2.2');
      
      // التأكد من وجود البروتوكول
      if (!fixedImageUrl.startsWith('http')) {
        fixedImageUrl = 'http://$fixedImageUrl';
      }
      
      print('Fixed Image URL: $fixedImageUrl'); // للتشخيص
    }
    
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: imageUrl.isNotEmpty 
          ? Image.network(
              fixedImageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              headers: {
                'Accept': 'image/*',
                'User-Agent': 'Flutter App',
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          color: primaryColor,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Loading image...',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                print('Image loading error: $error'); // للتشخيص
                print('Stack trace: $stackTrace'); // للتشخيص
                
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Failed to load image',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'URL: $fixedImageUrl',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // إعادة تحميل الصورة
                          (context as Element).markNeedsBuild();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: const Text(
                          'Retry',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No image available',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  },
),
                            const SizedBox(height: 16),
                            CustomButton(
                              textcolor: Colors.white,
                              text: 'ReGenerate Placment',
                              onTap: () {
                                context.read<OcrCubit>().RegenerateReplacement();
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox(
                    height: 200,
                    child: NoImagesSelected());
              })
            ],
          ),
        ),
      ),
    );
  }
}
