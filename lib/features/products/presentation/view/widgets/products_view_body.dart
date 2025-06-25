import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:gradution/features/products/presentation/view/widgets/dropdown_discount.dart';
import 'package:gradution/features/products/presentation/view/widgets/list_items_categoies.dart';
import 'package:gradution/features/products/presentation/view/widgets/product_item.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:   BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
       
          return Column(
        spacing: 15.h,
        children: [
          const ListItemsCategories(),
          const DropdownDiscount(),
            CustomTextformfield(
            hintText: 'Search for product',
            onSaved: (p0) {
              searchQuery = p0 ?? '';
               state.products.where((product) {
            return product.name
                .toLowerCase()
                .startsWith(searchQuery.toLowerCase());
          }).toList();
            },
            keyboardType: TextInputType.text,
            suffixIcon: Icon(Icons.search),
          ),
         Expanded(
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
          ),
        ],
      );
        } else if (state is ProductsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    )
    );
     
  }
}
