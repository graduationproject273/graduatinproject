
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_cubit.dart';
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';

class CardForOCR extends StatelessWidget {
  const CardForOCR({
    super.key,
    required this.product,
    required this.primaryColor,
    required this.isOutOfStock,
    required this.requestedQuantity,
    required this.isInCart,
    required this.index,
  });

  final ProductEntity product;
  final Color primaryColor;
  final bool isOutOfStock;
  final int? requestedQuantity;
  final bool isInCart;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
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
                  child:
                      const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            const SizedBox(width: 12),
    
            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isOutOfStock
                              ? Colors.red[50]
                              : Colors.green[50],
                          borderRadius:
                              BorderRadius.circular(4),
                          border: Border.all(
                            color: isOutOfStock
                                ? Colors.red[200]!
                                : Colors.green[200]!,
                          ),
                        ),
                        child: Text(
                          isOutOfStock
                              ? 'Out of Stock'
                              : 'Available: ${product.quantityAvailable}',
                          style: TextStyle(
                            fontSize: 11,
                            color: isOutOfStock
                                ? Colors.red[700]
                                : Colors.green[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (requestedQuantity != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2),
                          decoration: BoxDecoration(
                            color: primaryColor
                                .withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(4),
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
                    onPressed: () => context
                        .read<OcrCubit>()
                        .removeProductFromCart(index),
                    icon: const Icon(
                        Icons.remove_shopping_cart,
                        size: 16),
                    label: const Text('Remove',
                        style: TextStyle(fontSize: 11)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6)),
                      minimumSize: const Size(80, 32),
                    ),
                  )
                else
                  // Add to cart button
                  ElevatedButton.icon(
                    onPressed: isOutOfStock
                        ? null
                        : () => context
                            .read<OcrCubit>()
                            .addProductToCart(index),
                    icon: Icon(
                      isOutOfStock
                          ? Icons.block
                          : Icons.add_shopping_cart,
                      size: 16,
                    ),
                    label: Text(
                      isOutOfStock
                          ? 'Unavailable'
                          : 'Add to Cart',
                      style: const TextStyle(fontSize: 11),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isOutOfStock
                          ? Colors.grey[300]
                          : primaryColor,
                      foregroundColor: isOutOfStock
                          ? Colors.grey[600]
                          : Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6)),
                      minimumSize: const Size(80, 32),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
