import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/featrues/home/presentation/views/widgets/categories_item.dart';

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
    return Row(
        children: [
          // ListView أفقية
          SizedBox(
          height: 80.h,
          width: context.width*.87,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:Categoriesitem()
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