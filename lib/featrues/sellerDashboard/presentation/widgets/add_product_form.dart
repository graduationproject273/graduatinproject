import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/featrues/sellerDashboard/presentation/widgets/upload_photo_row.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final List<String> categories = [
    'Electronics', 'Clothes', 'Books', 'Home Appliances', 'Toys', 'Other',
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(label: 'Product Name'),
          const SizedBox(height: 10),
          _buildTextField(label: 'Product Price'),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: selectedCategory,
            decoration: _inputDecoration('Category'),
            items: categories
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),
          const SizedBox(height: 10),
          _buildTextField(label: 'Product Description', maxLines: 5),
          const SizedBox(height: 20),
          const UploadPhotoRow(),
          const SizedBox(height: 30),
          CustomButton(text: 'Add Product'),
        ],
      ),
    );
  }

  TextFormField _buildTextField({required String label, int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: _inputDecoration(label),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      label: Text(label),
      labelStyle: Textstyles.namereview.copyWith(fontSize: 14, color: maincolor),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: maincolor)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: maincolor, width: 2)),
      fillColor: Colors.white,
      filled: true,
    );
  }
}
