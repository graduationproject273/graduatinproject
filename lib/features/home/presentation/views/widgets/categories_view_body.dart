import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:gradution/features/products/presentation/view/widgets/product_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoaded) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            
            '${state.products.length} Products',
            style: Textstyles.namereview.copyWith(color: maincolor, fontSize: 20),
           
          ),
          const SizedBox(height: 16),

         Expanded(
           child: GridView.builder(
           
            itemCount: state.products.length,
        
             itemBuilder: (context, index) {
              return ProductItem(productEntity: state.products[index]);
             }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 150 / 270,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
             ),
                 ),
         )
        ],),
  );
            } else if (state is ProductsError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text('No products found.'));
            }
          },
         
      
    
    );
  }
}
