import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/categories_item.dart';

import '../wedgets/data/models/categories_model.dart';

class ListItemsCategories extends StatefulWidget {
  const ListItemsCategories({super.key});

  @override
  State<ListItemsCategories> createState() => _ListItemsCategoriesState();
}

class _ListItemsCategoriesState extends State<ListItemsCategories> {
  final List<CategoriesModel> categories = [
    CategoriesModel(name: 'Cameres', imageUrl: Assets.imagesCameres),
    CategoriesModel(name: ' Security', imageUrl: Assets.imagesHomesecurity),
    CategoriesModel(name: 'Network', imageUrl: Assets.imagesNetwork),
    CategoriesModel(name: ' lighting', imageUrl: Assets.imagesSmartlighting),
    CategoriesModel(name: 'Thermostat', imageUrl: Assets.imagesThermostat),
    CategoriesModel(name: 'panels', imageUrl: Assets.imagesSmartcenteralcontrolpanels),
   // CategoriesModel(name: 'Category 7', imageUrl: Assets.imagesThermostat),
  ];
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
    return Row(
        children: [
          // ListView أفقية
          SizedBox(
          height: 80.h,
          width: context.width*.87,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Categoriesitem(image: categories[index].imageUrl,text:  categories[index].name)
                );
              },
            ),
          ),
          // الزر بجانب القائمة
          Container(
            height: 37.h,
            width: 37.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: coloritemcat
            ),
            child: IconButton(
              onPressed: _scrollToEnd,
              icon: const Icon(Icons.arrow_forward),
              color: Colors.black,
            ),
          ),
        ],
      )
    ;
  }
}