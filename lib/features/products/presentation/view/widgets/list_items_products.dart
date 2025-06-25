import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:gradution/features/products/presentation/view/widgets/product_item.dart';

// ignore: camel_case_types
class listItemsProducts extends StatefulWidget {
  const listItemsProducts({
    super.key,
  });

  @override
  State<listItemsProducts> createState() => _listItemsProductsState();
}

class _listItemsProductsState extends State<listItemsProducts> {
 late  String select;
  String searchQuery =''  ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          state.products.where((product) {
            return product.name
                .toLowerCase()
                .startsWith(searchQuery.toLowerCase());
          }).toList();
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 150 / 270,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        GoRouter.of(context).push(Routes.productDetails);
                      },
                      child: ProductItem(productEntity: state.products[index]));
                },
                itemCount: 10,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          );
        } else if (state is ProductsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
