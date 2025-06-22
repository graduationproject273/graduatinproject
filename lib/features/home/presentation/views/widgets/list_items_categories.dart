import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/home/presentation/views/widgets/categories_item.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/get_all_category_cubit/get_all_category_cubit.dart';

class ListItemsCategories extends StatefulWidget {
  const ListItemsCategories({super.key});

  @override
  State<ListItemsCategories> createState() => _ListItemsCategoriesState();
}

class _ListItemsCategoriesState extends State<ListItemsCategories> {
  final ScrollController _scrollController = ScrollController();
  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<GetAllCategoryCubit>()..getAllcategoryfunction(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text('Categories',
              style: Textstyles.namereview.copyWith(color: Color(0xff9A9A9A))),
          Row(
            children: [
              // ListView أفقية
              BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
                builder: (context, state) {
                  if (state is GetAllCategorySuccess) {
                    return SizedBox(
                      height: 80.h,
                      width: context.width * .80,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(

                                onTap: () {
                                  GoRouter.of(context).push(Routes.categories,
                                      extra: state.categories[index].id);
                                },
                                child: Categoriesitem(
                                    image: state.categories[index].image,
                                    text: state.categories[index].name),
                              ));
                        },
                      ),
                    );
                  } else if (state is GetAllCategoyError) {
                    return Center(child: Text(state.error));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              // الزر بجانب القائمة
              Container(
                height: 37.h,
                width: 37.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: coloritemcat),
                child: IconButton(
                  onPressed: _scrollToEnd,
                  icon: const Icon(Icons.arrow_forward),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
