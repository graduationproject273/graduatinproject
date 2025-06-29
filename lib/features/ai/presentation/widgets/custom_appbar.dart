import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_cubit.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_state.dart';


class OcrAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OcrAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'OCR & Analysis',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: maincolor,
      centerTitle: true,
      elevation: 0,
      actions: [
        BlocBuilder<OcrCubit, OcrState>(
          builder: (context, state) {
            final cartCount = context.read<OcrCubit>().getCartItemsCount();
            return Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    // يمكنك هنا تمرير function أو التنقل لصفحة السلة
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
