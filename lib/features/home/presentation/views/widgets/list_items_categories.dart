import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/home/presentation/views/widgets/categories_item.dart';

import '../../../data/models/categories_model.dart';

class ListItemsCategories extends StatefulWidget {
  const ListItemsCategories({super.key});

  @override
  State<ListItemsCategories> createState() => _ListItemsCategoriesState();
}

class _ListItemsCategoriesState extends State<ListItemsCategories> {
  final List<CategoriesModel> categories = [
    CategoriesModel(name: 'Cameres',  Assets.imagesCameres),
    CategoriesModel(name: ' Security', Assets.imagesHomesecurity),
    CategoriesModel(name: 'Network', Assets.imagesNetwork),
    CategoriesModel(name: ' lighting',  Assets.imagesSmartlighting),
    CategoriesModel(name: 'Thermostat', Assets.imagesThermostat),
    CategoriesModel(name: 'panels',  Assets.imagesSmarcenteralcontrolpanels),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text('Categories',style:Textstyles.namereview.copyWith(color: Color(0xff9A9A9A))),
   
        Row(
            children: [
              // ListView أفقية
              SizedBox(
              height: 80.h,
              width: context.width*.80,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Categoriesitem(image: categories[index].imageUrl!,text:  categories[index].name)
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
          ),
      ],
    )
    ;
  }
}