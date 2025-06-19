import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/products/presentation/view/widgets/product_item.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/cubit/get_product_seller_cubit.dart';

class ProductsSellerViewBody extends StatelessWidget {
  const ProductsSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Products For Seller',
          style: Textstyles.namereview,
        ),
        centerTitle: true,
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child:
                      BlocBuilder<GetProductSellerCubit, GetProductSellerState>(
                    builder: (context, state) {
                      if (state is GetProductSellerSuccess) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 150 / 270,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(Routes.productDetails);
                                },
                                child: ProductItem(
                                  productEntity: state.products[index],
                                ));
                          },
                          itemCount: state.products.length,
                          shrinkWrap: true,
                        );
                      } else if (state is GetAllProductError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: Textstyles.namereview.copyWith(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
