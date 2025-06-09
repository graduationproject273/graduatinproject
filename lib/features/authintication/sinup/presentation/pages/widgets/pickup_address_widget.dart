import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class PickupAddressWidget extends StatelessWidget {
  const PickupAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(hintText: 'Name', keyboardType: TextInputType.text),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: CustomTextformfield(hintText: 'Mobile', keyboardType: TextInputType.number)),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomTextformfield(hintText: 'Pin Code', keyboardType: TextInputType.number),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Address', keyboardType: TextInputType.text),
            const SizedBox(height: 20),
            CustomTextformfield(hintText: 'Locality', keyboardType: TextInputType.text),
            const SizedBox(height: 20),
                Row(
              children: [
                Expanded(child: CustomTextformfield(hintText: 'City', keyboardType: TextInputType.text)),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomTextformfield(hintText: 'State', keyboardType: TextInputType.text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}