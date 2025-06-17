import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';
import 'package:gradution/features/cart/presentation/widgets/body_in_cart_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                context.read<CartCubit>().clearCart();
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
  body: BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    if (state is CartLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CartLoaded) {
      return bodyInCartView(products: state.productitems);
    }  else if (state is CartError) {
      return Center(child: Text(state.message));
    } else {
      return const SizedBox.shrink();
    }
  },
),

    );
  }
}
