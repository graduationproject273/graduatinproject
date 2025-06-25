import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/add_product_cubit/add_product_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/drowpdown_categories.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/upload_photo_row.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    int catid = 0;
    return BlocListener<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          // Clear all controllers
          context.read<AddProductCubit>().descriptionController.clear();
          context.read<AddProductCubit>().priceController.clear();
          context.read<AddProductCubit>().sellingPriceController.clear();
          context.read<AddProductCubit>().discountController.clear();
          context.read<AddProductCubit>().quantityController.clear();
          context.read<AddProductCubit>().hardwareSpecificationsController.clear();
          context.read<AddProductCubit>().nameController.clear();
          
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 10),
                  Text('تم إضافة المنتج بنجاح!'),
                ],
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
          
          GoRouter.of(context).push(Routes.sellerProducts);
        } else if (state is AddProductFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(child: Text(state.error)),
                ],
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        }
      },
      child: Container(
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
            key: context.read<AddProductCubit>().formKey2,
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
                        Icons.add_business_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Add New Product',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Add your product details below',
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
                      controller: context.read<AddProductCubit>().nameController,
                      hintText: 'Product Name',
                      icon: Icons.shopping_bag_outlined,
                      validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter product name' : null,
                    ),
                    const SizedBox(height: 15),
                    _buildEnhancedTextField(
                      controller: context.read<AddProductCubit>().descriptionController,
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
                  title: 'Pricing and Discounts',
                  icon: Icons.attach_money,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildEnhancedTextField(
                            controller: context.read<AddProductCubit>().priceController,
                            hintText: 'Original Price',
                            icon: Icons.monetization_on_outlined,
                            keyboardType: TextInputType.number,
                            validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter original price' : null,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildEnhancedTextField(
                            controller: context.read<AddProductCubit>().sellingPriceController,
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
                      controller: context.read<AddProductCubit>().discountController,
                      hintText: 'Discount Percentage',
                      icon: Icons.discount_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
            
                const SizedBox(height: 20),
            
                // Inventory & Specs Section
                _buildSectionCard(
                  title: 'stock and Specifications',
                  icon: Icons.inventory_2_outlined,
                  children: [
                    _buildEnhancedTextField(
                      controller: context.read<AddProductCubit>().quantityController,
                      hintText: 'Available Quantity',
                      icon: Icons.inventory_outlined,
                      keyboardType: TextInputType.number,
                      validator: (p0) => p0 == null || p0.isEmpty ? 'Please enter available quantity' : null,
                    ),
                    const SizedBox(height: 15),
                    _buildEnhancedTextField(
                      controller: context.read<AddProductCubit>().hardwareSpecificationsController,
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
                  title: 'category',
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
            
                const SizedBox(height: 20),
            
                // Image Upload Section
                _buildSectionCard(
                  title: 'Upload Product Image',
                  icon: Icons.photo_camera_outlined,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: maincolor.withOpacity(0.3)),
                      ),
                      child: const UploadPhotoRow(),
                    ),
                  ],
                ),
            
                const SizedBox(height: 40),
            
                // Enhanced Action Button
                BlocBuilder<AddProductCubit, AddProductState>(
                  builder: (context, state) {
                    bool isLoading = state is AddProductLoading;
                    
                    return Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isLoading 
                            ? [Colors.grey, Colors.grey.withOpacity(0.8)]
                            : [maincolor, maincolor.withOpacity(0.8)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: (isLoading ? Colors.grey : maincolor).withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: isLoading ? null : () {
                            print('Selected Category ID: $catid');
                            print('Image URL: ${context.read<AddProductCubit>().imageUrl}');
                            
                            if (context.read<AddProductCubit>().formKey2.currentState!.validate() &&
                                catid != 0 &&
                                context.read<AddProductCubit>().imageUrl.isNotEmpty) {
                              context.read<AddProductCubit>().addProduct(
                                AddProductModel(
                                  discountPrice: double.tryParse(
                                    context.read<AddProductCubit>().discountController.text
                                  ) ?? 0,
                                  name: context.read<AddProductCubit>().nameController.text,
                                  image: context.read<AddProductCubit>().imageUrl,
                                  price: double.parse(
                                    context.read<AddProductCubit>().priceController.text
                                  ),
                                  description: context.read<AddProductCubit>().descriptionController.text,
                                  category: CategoryModel(id: catid),
                                  specialOffer: (double.tryParse(
                                    context.read<AddProductCubit>().discountController.text
                                  ) ?? 0) > 0,
                                  hardwareSpecifications: context.read<AddProductCubit>().hardwareSpecificationsController.text,
                                  sellingPrice: double.parse(
                                    context.read<AddProductCubit>().sellingPriceController.text
                                  ),
                                  quantityAvailable: int.parse(
                                    context.read<AddProductCubit>().quantityController.text
                                  ),
                                ),
                              );
                            } else {
                              // Show validation errors
                              String errorMessage = '';
                              if (catid == 0) errorMessage += 'Please select a category\n';
                              if (context.read<AddProductCubit>().imageUrl.isEmpty) {
                                errorMessage += 'Please upload an image\n';
                              }
                              
                              if (errorMessage.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage.trim()),
                                    backgroundColor: Colors.orange,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isLoading) ...[
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'جاري الإضافة...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ] else ...[
                                Icon(
                                  Icons.add_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Add Product',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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