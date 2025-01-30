import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/dropdown_discount.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/list_items_categoies.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/list_items_products.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 15.h,
        children: [
          const listItemsCategories(),
          const DropdownDiscount(),
            CustomTextformfield(
            hintText: 'Search for product',
            keyboardType: TextInputType.text,
            suffixIcon: Icon(Icons.search),
          ),
          const listItemsProducts()
        ],
      ),
    );
  }
}
