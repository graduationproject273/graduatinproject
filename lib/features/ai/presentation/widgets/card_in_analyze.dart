
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/ai/data/models/recomedmodel.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_cubit.dart';

class CardInAnalyze extends StatelessWidget {
  const CardInAnalyze({
    super.key,
    required this.rec,
    required this.primaryColor,
    required this.isInCart,
    required this.index,
  });

  final RecommendationModel rec;
  final Color primaryColor;
  final bool isInCart;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 8),
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
              child: const Icon(
                  Icons.image_not_supported,
                  size: 20),
            ),
          ),
        ),
        title: Text(
          rec.name,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius:
                      BorderRadius.circular(4),
                  border: Border.all(
                      color: Colors.green[200]!),
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
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                          '${rec.name} removed from cart!'),
                      backgroundColor: Colors.orange,
                      duration:
                          const Duration(seconds: 1),
                    ),
                  );
                },
                icon: const Icon(
                    Icons.remove_shopping_cart,
                    color: Colors.red),
                tooltip: 'Remove from cart',
              )
            : ElevatedButton.icon(
                onPressed: () => context
                    .read<OcrCubit>()
                    .addRecommendationToCart(index),
                icon: const Icon(
                    Icons.add_shopping_cart,
                    size: 14),
                label: const Text('Add',
                    style: TextStyle(fontSize: 11)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6)),
                  minimumSize: const Size(60, 28),
                ),
              ),
      ),
    );
  }
}
