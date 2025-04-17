import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/product_item.dart';

class ProductsSellerViewBody extends StatelessWidget {
  const ProductsSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
          child: Column(
            children: [
              Text('Products For Seller',style: Textstyles.namereview,),
              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}