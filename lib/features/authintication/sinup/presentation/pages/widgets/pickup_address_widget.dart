import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/seller_cubit/cubit/seller_cubit.dart';

class PickupAddressWidget extends StatelessWidget {
  const PickupAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(hintText: 'Name', keyboardType: TextInputType.text,
                controller: context.read<SellerCubit>().nameController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: CustomTextformfield(hintText: 'Mobile', keyboardType: TextInputType.number,
                    controller: context.read<SellerCubit>().mobileController,
                )),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomTextformfield(hintText: 'Zip Code', keyboardType: TextInputType.number,
                      controller: context.read<SellerCubit>().zipCodeController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
           // CustomTextformfield(hintText: 'Address', keyboardType: TextInputType.text),
           Text(
              'Address',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'street', keyboardType: TextInputType.text,
                controller: context.read<SellerCubit>().streetController,
            ),
            const SizedBox(height: 20),
                Row(
              children: [
                Expanded(child: CustomTextformfield(hintText: 'City', keyboardType: TextInputType.text,
                controller: context.read<SellerCubit>().cityController,
                )),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomTextformfield(hintText: 'State', keyboardType: TextInputType.text,
                    controller: context.read<SellerCubit>().stateController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}