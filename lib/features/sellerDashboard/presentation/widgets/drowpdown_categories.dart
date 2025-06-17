import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/cubit/cubit/get_all_category_cubit.dart';


class DrowpdownCategories extends StatefulWidget {
  const DrowpdownCategories({super.key, this.onCategorySelected});
  final void Function(int)? onCategorySelected;

  @override
  State<DrowpdownCategories> createState() => _DrowpdownCategoriesState();
}

class _DrowpdownCategoriesState extends State<DrowpdownCategories> {
  CategoryItem? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  sl<GetAllCategoryCubit>()..getAllcategoryfunction(),
      child: BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
        builder: (context, state) {
          if (state is GetAllCategorySuccess) {
            List<CategoryItem> categories = state.categories
                .map((e) => CategoryItem(id: e.id, name: e.name))
                .toList();

            if (categories.isEmpty) {
              return const Center(child: Text('No categories available'));
            }

            return DropdownButtonFormField<CategoryItem>(
              value: selectedCategory,
              decoration: _inputDecoration('Category'),
              items: categories.map((category) {
                return DropdownMenuItem<CategoryItem>(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
 if (value != null && widget.onCategorySelected != null) {
                  widget.onCategorySelected!(value.id);
                }
              },
                // 🟢 استخدم selectedCategory!.id حسب الحاجة
              
             
            );
          } else if (state is GetAllCategoyError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      label: Text(label),
      labelStyle:
          Textstyles.namereview.copyWith(fontSize: 14, color: maincolor),
      border: const OutlineInputBorder(),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: maincolor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: maincolor, width: 2)),
      fillColor: Colors.white,
      filled: true,
    );
  }
}

/// موديل مساعد لتفادي خطأ Dropdown
class CategoryItem {
  final int id;
  final String name;

  CategoryItem({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryItem &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
