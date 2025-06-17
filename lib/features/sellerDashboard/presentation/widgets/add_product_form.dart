import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
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
          context.read<AddProductCubit>().descriptionController.clear();
          context.read<AddProductCubit>().descriptionController.clear();
          context.read<AddProductCubit>().priceController.clear();
          context.read<AddProductCubit>().sellingPriceController.clear();
          context.read<AddProductCubit>().discountController.clear();
          context.read<AddProductCubit>().quantityController.clear();
          context
              .read<AddProductCubit>()
              .hardwareSpecificationsController
              .clear();
          context.read<AddProductCubit>().nameController.clear();
          GoRouter.of(context).push(Routes.sellerProducts);
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: context.read<AddProductCubit>().formKey2,
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
                hintText: 'Product Name',
                controller: context.read<AddProductCubit>().nameController,
                keyboardType: TextInputType.text,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: maincolor, width: 2),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextformfield(
                validator: (p0) => p0 == null || p0.isEmpty
                    ? 'Please enter a product description'
                    : null,
                hintText: 'price price',
                controller: context.read<AddProductCubit>().priceController,
                keyboardType: TextInputType.number,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: maincolor, width: 2),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextformfield(
                validator: (p0) => p0 == null || p0.isEmpty
                    ? 'Please enter a product description'
                    : null,
                hintText: 'Product Selling price',
                controller:
                    context.read<AddProductCubit>().sellingPriceController,
                keyboardType: TextInputType.number,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: maincolor, width: 2),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextformfield(
                validator: (p0) => p0 == null || p0.isEmpty
                    ? 'Please enter a product description'
                    : null,
                hintText: 'Discount price',
                controller: context.read<AddProductCubit>().discountController,
                keyboardType: TextInputType.text,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: maincolor, width: 2),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextformfield(
                validator: (p0) => p0 == null || p0.isEmpty
                    ? 'Please enter a product description'
                    : null,
                controller: context.read<AddProductCubit>().quantityController,
                hintText: 'Quantity Available',
                keyboardType: TextInputType.number,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: maincolor, width: 2),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextformfield(
                validator: (p0) => p0 == null || p0.isEmpty
                    ? 'Please enter a product description'
                    : null,
                hintText: 'Hardware Specifications',
                controller: context
                    .read<AddProductCubit>()
                    .hardwareSpecificationsController,
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
                controller:
                    context.read<AddProductCubit>().descriptionController,
                maxLines: 5,
                hintText: ' Product Description',
                keyboardType: TextInputType.text,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: maincolor, width: 2),
                ),
              ),
              const SizedBox(height: 20),
              const UploadPhotoRow(),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Add Product',
                onTap: () {
                  print(context.read<AddProductCubit>().imageUrl);
                  print(catid);
                  if (context
                          .read<AddProductCubit>()
                          .formKey2
                          .currentState!
                          .validate() &&
                      catid != 0 &&
                      context.read<AddProductCubit>().imageUrl.isNotEmpty) {
                    context.read<AddProductCubit>().addProduct(AddProductModel(
                        name: context
                            .read<AddProductCubit>()
                            .descriptionController
                            .text,
                        image: context.read<AddProductCubit>().imageUrl,
                        price: double.parse(context
                            .read<AddProductCubit>()
                            .priceController
                            .text),
                        description: context
                            .read<AddProductCubit>()
                            .descriptionController
                            .text,
                        categoryId: catid,
                        quantityAvailable: double.parse(context
                            .read<AddProductCubit>()
                            .quantityController
                            .text),
                        specialOffer: (double.tryParse(context
                                    .read<AddProductCubit>()
                                    .discountController
                                    .text) ??
                                0) >
                            0,
                        hardwareSpecifications: context
                            .read<AddProductCubit>()
                            .hardwareSpecificationsController
                            .text,
                        sellingPrice: double.parse(context
                            .read<AddProductCubit>()
                            .sellingPriceController
                            .text),
                        discount: double.parse(context
                            .read<AddProductCubit>()
                            .discountController
                            .text)));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
