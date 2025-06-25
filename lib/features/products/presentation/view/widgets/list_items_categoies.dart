import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:gradution/features/products/presentation/view/widgets/item_category.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/get_all_category_cubit/get_all_category_cubit.dart';

class ListItemsCategories extends StatefulWidget {
  const ListItemsCategories({super.key});

  @override
  State<ListItemsCategories> createState() => _ListItemsCategoriesState();
}

class _ListItemsCategoriesState extends State<ListItemsCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<GetAllCategoryCubit>()..getAllcategoryfunction(),
      child: SizedBox(
        height: 40.h,
        child: BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
          builder: (context, state) {
            if (state is GetAllCategoyError) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is GetAllCategorySuccess) {
              final categories = state.categories;

              if (categories.isEmpty) {
                return const Center(child: Text("لا توجد تصنيفات"));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categories[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.r),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        context.read<ProductsCubit>().getProduct(
                          '${EndPoints.products}/filter?categoryId=${category.id}',
                        );
                      },
                      child: itemCategory(
                        text: category.name,
                        color:
                            selectedIndex == index ? maincolor : coloritemcat,
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
