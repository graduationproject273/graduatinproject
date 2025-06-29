import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_cubit.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_state.dart';

class OcrView extends StatelessWidget {
  const OcrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF00917C);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'OCR & Analysis',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        actions: [
          // Cart items count badge
          BlocBuilder<OcrCubit, OcrState>(
            builder: (context, state) {
              final cartCount = context.read<OcrCubit>().getCartItemsCount();
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {
                      // Navigate to cart page
                      // Navigator.pushNamed(context, '/cart');
                    },
                  ),
                  if (cartCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$cartCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Switch between OCR and Analysis
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.read<OcrCubit>().setProcessType(ImageProcessType.ocr),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.ocr
                                ? primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'OCR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.ocr
                                  ? Colors.white
                                  : primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.read<OcrCubit>().setProcessType(ImageProcessType.analysis),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.analysis
                                ? primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Analyze Image',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.analysis
                                  ? Colors.white
                                  : primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Image upload box
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(Icons.image_outlined, size: 60, color: primaryColor),
                    const SizedBox(height: 16),
                    const Text(
                      'Select Image for Processing',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Choose an image from gallery or camera',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => context.read<OcrCubit>().pickImageFromGallery(),
                            icon: const Icon(Icons.photo_library, color: Colors.white),
                            label: const Text('Gallery', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => context.read<OcrCubit>().pickImageFromCamera(),
                            icon: const Icon(Icons.camera_alt, color: Colors.white),
                            label: const Text('Camera', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Results
              Expanded(
                child: BlocBuilder<OcrCubit, OcrState>(
                  builder: (context, state) {
                    if (state is OcrLoading) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: primaryColor),
                            const SizedBox(height: 16),
                            const Text(
                              'Processing image...',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }

                    // OCR Results with products
                    if (state is OcrSuccess || state is ProductsUpdated) {
                      final products = state is OcrSuccess ? state.products : (state as ProductsUpdated).products;
                      final requestedQuantity = context.read<OcrCubit>().requestedQuantity;
                      
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with cart count
                          Row(
                            children: [
                              const Text(
                                'Matched Products',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              if (requestedQuantity != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: primaryColor.withOpacity(0.3)),
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
                          
                          // Products List
                          Expanded(
                            child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                final isOutOfStock = product.quantityAvailable <= 0;
                                final isInCart = product.isAddedToCart;
                                
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 6),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        // Product Image
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            product.image,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) => Container(
                                              width: 60,
                                              height: 60,
                                              color: Colors.grey[300],
                                              child: const Icon(Icons.image_not_supported),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        
                                        // Product Info
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                'EGP ${product.sellingPrice}',
                                                style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              // Availability and Requested Quantity
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: isOutOfStock ? Colors.red[50] : Colors.green[50],
                                                      borderRadius: BorderRadius.circular(4),
                                                      border: Border.all(
                                                        color: isOutOfStock ? Colors.red[200]! : Colors.green[200]!,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      isOutOfStock 
                                                          ? 'Out of Stock' 
                                                          : 'Available: ${product.quantityAvailable}',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: isOutOfStock ? Colors.red[700] : Colors.green[700],
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  if (requestedQuantity != null) ...[
                                                    const SizedBox(width: 8),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                                      decoration: BoxDecoration(
                                                        color: primaryColor.withOpacity(0.1),
                                                        borderRadius: BorderRadius.circular(4),
                                                      ),
                                                      child: Text(
                                                        'Need: $requestedQuantity',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: primaryColor,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        
                                        // Cart Actions
                                        Column(
                                          children: [
                                            if (isInCart)
                                              // Remove from cart button
                                              ElevatedButton.icon(
                                                onPressed: () => context.read<OcrCubit>().removeProductFromCart(index),
                                                icon: const Icon(Icons.remove_shopping_cart, size: 16),
                                                label: const Text('Remove', style: TextStyle(fontSize: 11)),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red[400],
                                                  foregroundColor: Colors.white,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                  minimumSize: const Size(80, 32),
                                                ),
                                              )
                                            else
                                              // Add to cart button
                                              ElevatedButton.icon(
                                                onPressed: isOutOfStock 
                                                    ? null 
                                                    : () => context.read<OcrCubit>().addProductToCart(index),
                                                icon: Icon(
                                                  isOutOfStock 
                                                      ? Icons.block 
                                                      : Icons.add_shopping_cart,
                                                  size: 16,
                                                ),
                                                label: Text(
                                                  isOutOfStock ? 'Unavailable' : 'Add to Cart',
                                                  style: const TextStyle(fontSize: 11),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: isOutOfStock ? Colors.grey[300] : primaryColor,
                                                  foregroundColor: isOutOfStock ? Colors.grey[600] : Colors.white,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                  minimumSize: const Size(80, 32),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          // Bulk Actions
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () => context.read<OcrCubit>().addAllProductsToCart(),
                                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                                  label: const Text(
                                    'Add All to Cart',
                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () => context.read<OcrCubit>().removeAllFromCart(),
                                  icon: Icon(Icons.clear_all, color: primaryColor),
                                  label: Text(
                                    'Clear All',
                                    style: TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: primaryColor),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    // Room Analysis Results
                    if (state is RoomAnalysisSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Analysis Header
                          const Text(
                            'Room Analysis Results',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          
                          Expanded(
                            child: ListView(
                              children: [
                                // Detected Objects Section
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
                                          Icon(Icons.visibility, color: primaryColor, size: 20),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Detected Objects',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: state.analysis.detectedObjects.map((obj) => 
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: primaryColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: primaryColor.withOpacity(0.3)),
                                            ),
                                            child: Text(
                                              obj,
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                
                                // Recommendations Section
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
                                          Icon(Icons.recommend, color: primaryColor, size: 20),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Recommendations',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                                      
                                      // Recommendations List
                                      ...state.analysis.recommendations.asMap().entries.map((entry) {
                                        final index = entry.key;
                                        final rec = entry.value;
                                        final isInCart = rec.isAddedToCart;
                                        
                                        return Card(
                                          margin: const EdgeInsets.symmetric(vertical: 4),
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          child: ListTile(
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                            leading: ClipRRect(
                                              borderRadius: BorderRadius.circular(6),
                                              child: Image.network(
                                                rec.image,
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                                errorBuilder: (_, __, ___) => Container(
                                                  width: 50,
                                                  height: 50,
                                                  color: Colors.grey[300],
                                                  child: const Icon(Icons.image_not_supported, size: 20),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              rec.name,
                                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 4),
                                                Text(
                                                  'EGP ${rec.price}',
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                if (isInCart)
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 4),
                                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: Colors.green[50],
                                                      borderRadius: BorderRadius.circular(4),
                                                      border: Border.all(color: Colors.green[200]!),
                                                    ),
                                                    child: Text(
                                                      'Added to Cart',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.green[700],
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            trailing: isInCart
                                                ? IconButton(
                                                    onPressed: () {
                                                      // Remove from cart logic
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text('${rec.name} removed from cart!'),
                                                          backgroundColor: Colors.orange,
                                                          duration: const Duration(seconds: 1),
                                                        ),
                                                      );
                                                    },
                                                    icon: const Icon(Icons.remove_shopping_cart, color: Colors.red),
                                                    tooltip: 'Remove from cart',
                                                  )
                                                : ElevatedButton.icon(
                                                    onPressed: () => context.read<OcrCubit>().addRecommendationToCart(index),
                                                    icon: const Icon(Icons.add_shopping_cart, size: 14),
                                                    label: const Text('Add', style: TextStyle(fontSize: 11)),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: primaryColor,
                                                      foregroundColor: Colors.white,
                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                      minimumSize: const Size(60, 28),
                                                    ),
                                                  ),
                                          ),
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          
                          // Add All Recommendations Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () => context.read<OcrCubit>().addAllRecommendationsToCart(),
                              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                              label: const Text(
                                'Add All Recommendations to Cart',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    // Initial state
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_search, size: 80, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            'No image selected yet',
                            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Choose an image to start processing',
                            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}