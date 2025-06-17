import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';
import 'package:gradution/features/cart/presentation/widgets/item_cart.dart';

// ignore: camel_case_types
class listItemsCarts extends StatelessWidget {
  final List<CartItemEntity> products;
  const listItemsCarts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .6,
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is CartLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('cart loaded successfully')),
            );
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: state is CartLoaded
                ? state.productitems.length
                : products.length, // Use the length from CartLoaded state or fallback to products list
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ItemCart(
                  product: state is CartLoaded
                      ? state.productitems[index]
                      : products[index], // Use the product from CartLoaded state or fallback to products list
                ),
              );
            },
          );
        },
      ),
    );
  }
}
