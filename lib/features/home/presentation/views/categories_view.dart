import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/home/presentation/views/widgets/categories_view_body.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.id});
 final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsCubit>()..getProductById(id),
      child:  Scaffold (
          appBar: AppBar(
            title: const Text('Categories'),
            backgroundColor:maincolor,
          ),
          backgroundColor: Colors.white,
          body: CategoriesViewBody(),
        ),
    );
  }
}