import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/edit_product_cubit/edit_product_seller_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/drowpdown_categories.dart';

class EditProductSellerBody extends StatelessWidget {
  const EditProductSellerBody({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    int catid = 0;
    final cubit = context.read<EditProductSellerCubit>();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey[50]!,
            Colors.white,
            Colors.grey[50]!,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                
                // Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [maincolor.withOpacity(0.8), maincolor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: maincolor.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Edit Product',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Please fill in the details below to update your product.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),

                // Product Basic Info Section
                _buildSectionCard(
                  title: 'Main Information',
                  icon: Icons.info_outline,
                  children: [
                    _buildEnhancedTextField(
                      controller: cubit.nameController,
                      hintText: 'Product Name',
                      icon: Icons.shopping_bag_outlined,
                      validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter product name' : null,
                    ),
                    const SizedBox(height: 15),
                    _buildEnhancedTextField(
                      controller: cubit.descriptionController,
                      hintText: 'Product Description',
                      icon: Icons.description_outlined,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Pricing Section
                _buildSectionCard(
                  title: 'Prices & Discounts',
                  icon: Icons.attach_money,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildEnhancedTextField(
                            controller: cubit.priceController,
                            hintText: 'Original Price',
                            icon: Icons.monetization_on_outlined,
                            keyboardType: TextInputType.number,
                            validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter original price' : null,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildEnhancedTextField(
                            controller: cubit.sellingPriceController,
                            hintText: 'Selling Price',
                            icon: Icons.local_offer_outlined,
                            keyboardType: TextInputType.number,
                            validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter selling price' : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    _buildEnhancedTextField(
                      controller: cubit.discountController,
                      hintText: 'Discount Percentage',
                      icon: Icons.discount_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Inventory & Specs Section
                _buildSectionCard(
                  title: 'Inventory & Specifications',
                  icon: Icons.inventory_2_outlined,
                  children: [
                    _buildEnhancedTextField(
                      controller: cubit.quantityController,
                      hintText: 'Quantity Available',
                      icon: Icons.inventory_outlined,
                      keyboardType: TextInputType.number,
                      validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter quantity' : null,
                    ),
                    const SizedBox(height: 15),
                    _buildEnhancedTextField(
                      controller: cubit.hardwareSpecificationsController,
                      hintText: 'Hardware Specifications',
                      icon: Icons.settings_outlined,
                      maxLines: 3,
                      validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter hardware specifications' : null,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Category Section
                _buildSectionCard(
                  title: 'Select Category',
                  icon: Icons.category_outlined,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: maincolor.withOpacity(0.3)),
                      ),
                      child: DrowpdownCategories(
                        onCategorySelected: (p0) {
                          catid = p0;
                          print('Selected Category ID: $catid');
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Enhanced Action Button
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [maincolor, maincolor.withOpacity(0.8)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: maincolor.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () async {
                        if (cubit.formKey2.currentState!.validate()) {
                          await cubit.editProduct(
                            AddProductModel(
                              name: cubit.nameController.text,
                              price: double.parse(cubit.priceController.text),
                              sellingPrice: double.parse(cubit.sellingPriceController.text),
                              discountPrice: double.tryParse(cubit.discountController.text) ?? 0,
                              description: cubit.descriptionController.text,
                              quantityAvailable: int.parse(cubit.quantityController.text),
                              hardwareSpecifications: cubit.hardwareSpecificationsController.text,
                              image: cubit.imageUrl,
                              category: CategoryModel(id: catid),
                              specialOffer: (double.tryParse(cubit.discountController.text) ?? 0) > 0,
                            ),
                            id,
                          );

                          if (context.read<EditProductSellerCubit>().state is EditProductSuccess) {
                            Navigator.of(context).pop(true);
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Save Changes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: maincolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: maincolor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildEnhancedTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    int? maxLines,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        maxLines: maxLines ?? 1,
        validator: validator,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[800],
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: maincolor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: maincolor,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}