import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/products/presentation/view/widgets/product_item.dart';

// ignore: camel_case_types
class listItemsProducts extends StatelessWidget {
  const listItemsProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:  150/270,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return  InkWell(onTap: (){
             GoRouter.of(context).push(Routes.productDetails);
            },
            
            child: ProductItem());
          },
          itemCount: 10,
          shrinkWrap: true,
         // physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
