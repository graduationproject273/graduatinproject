import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/edit_product_cubit/edit_product_seller_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/drowpdown_categories.dart';

class EditProductSellerBody extends StatelessWidget {
  const EditProductSellerBody({super.key, required this.name, required this.price, required this.sellingPrice, required this.discountPrice, required this.quantityAvailable, required this.hardwareSpecifications, required this.productDescription, required this.productImage, required this.productId});
  final String name ;
  final String price ;
  final String sellingPrice ;
  final String discountPrice;
  final String quantityAvailable ;
  final String hardwareSpecifications ;
  final String productDescription ;
  final String productImage ;
  final int productId;
  @override
  Widget build(BuildContext context) {
        int catid = 0;

    return SingleChildScrollView(
        child: Form(
          key: context.read<EditProductSellerCubit>().formKey2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CustomTextformfield(
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                  hintText: name,
                  controller: context.read<EditProductSellerCubit>().nameController,
                  keyboardType: TextInputType.text,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor, width: 2),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: context.read<EditProductSellerCubit>().priceController,
                  validator: (p0) => p0 == null || p0.isEmpty
                      ? 'Please enter a product description'
                      : null,
                  hintText: price,
                  keyboardType: TextInputType.number,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor, width: 2),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: context.read<EditProductSellerCubit>().sellingPriceController,
                  validator: (p0) => p0 == null || p0.isEmpty
                      ? 'Please enter a product description'
                      : null,
                  hintText: sellingPrice,
                  
                  keyboardType: TextInputType.number,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor, width: 2),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: context.read<EditProductSellerCubit>().discountController,
                  validator: (p0) => p0 == null || p0.isEmpty
                      ? 'Please enter a product description'
                      : null,
                  hintText: discountPrice,
                 
                  keyboardType: TextInputType.text,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor, width: 2),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: context.read<EditProductSellerCubit>().quantityController,
                  validator: (p0) => p0 == null || p0.isEmpty
                      ? 'Please enter a product description'
                      : null,
                  
                  hintText:quantityAvailable ,
                  keyboardType: TextInputType.number,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor, width: 2),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: context.read<EditProductSellerCubit>().hardwareSpecificationsController,
                  validator: (p0) => p0 == null || p0.isEmpty
                      ? 'Please enter a product description'
                      : null,
                  hintText: hardwareSpecifications,
                
                  keyboardType: TextInputType.text,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor, width: 2),
                  ),
                ),
                const SizedBox(height: 10),
                DrowpdownCategories(
                  onCategorySelected: (p0) {
                    catid = p0;
                    print('Selected Category ID: $catid');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                 
                 controller: context.read<EditProductSellerCubit>().descriptionController,
                  maxLines: 5,
                  hintText: productDescription,
                  keyboardType: TextInputType.text,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor, width: 2),
                  ),
                ),
                const SizedBox(height: 20),
               // const UploadPhotoRow(),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Add Product',
                  onTap: () {
 if (context
                          .read<EditProductSellerCubit>()
                          .formKey2
                          .currentState!
                          .validate() 
                     ) {
                    context.read<EditProductSellerCubit>().editProduct(
                      AddProductModel(
                        discountPrice: double.tryParse(
                              context
                                  .read<EditProductSellerCubit>()
                                  .discountController
                                  .text) ??
                            0,
                        name: context
                            .read<EditProductSellerCubit>()
                            .nameController
                            .text,
                        image: context.read<EditProductSellerCubit>().imageUrl,
                        price: double.parse(context
                            .read<EditProductSellerCubit>()
                            .priceController
                            .text),
                        description: context
                            .read<EditProductSellerCubit>()
                            .descriptionController
                            .text,
                        category: CategoryModel(id: 52,),
                        specialOffer: (double.tryParse(context
                                    .read<EditProductSellerCubit>()
                                    .discountController
                                    .text) ??
                                0) >
                            0,
                        hardwareSpecifications: context
                            .read<EditProductSellerCubit>()
                            .hardwareSpecificationsController
                            .text,
                        sellingPrice: double.parse(context
                            .read<EditProductSellerCubit>()
                            .sellingPriceController
                            .text),
                        quantityAvailable: int.parse(context
                            .read<EditProductSellerCubit>()
                            .quantityController
                            .text)
                      ),
                      productId 
                    );
                  }
                  } ),
              ],
            ),
          ),
        ),
      );
  }
}