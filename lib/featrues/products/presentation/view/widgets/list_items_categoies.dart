import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/featrues/home/data/models/categories_model.dart';
import 'package:gradution/featrues/products/presentation/view/widgets/item_category.dart';

// ignore: camel_case_types
class listItemsCategories extends StatefulWidget {
  const listItemsCategories({
    super.key,
  });

  @override
  State<listItemsCategories> createState() => _listItemsCategoriesState();
}

// ignore: camel_case_types
class _listItemsCategoriesState extends State<listItemsCategories> {
  int selectedIndex = 0;
  final List<CategoriesModel> categories = [
    CategoriesModel(name: 'All', Assets.imagesCameres),
    CategoriesModel(name: 'Cameres', Assets.imagesCameres),
    CategoriesModel(name: 'Home Security', Assets.imagesHomesecurity),
    CategoriesModel(name: 'Network', Assets.imagesNetwork),
    CategoriesModel(name: 'Smart lighting', Assets.imagesSmartlighting),
    CategoriesModel(name: 'Thermostat', Assets.imagesThermostat),
    CategoriesModel(name: 'Smart Centeral Control Panels', Assets.imagesSmar),
    // CategoriesModel(name: 'Category 7', imageUrl: Assets.imagesThermostat),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: itemCategory(
              text: categories[index].name,
              color: selectedIndex == index ? maincolor : coloritemcat,
            ),
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
