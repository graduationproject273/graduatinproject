import 'package:flutter/material.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class RowNumbersInSelection extends StatelessWidget {
  const RowNumbersInSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0,right: 40,top: 30),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Length (meter)*'),
                const SizedBox(height: 10),
                CustomTextformfield(
                  hintText: 'i.e. 5',
                  keyboardType: TextInputType.number,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Number of curtains*'),
                const SizedBox(height: 10),
                CustomTextformfield(
                  hintText: 'i.e. 2',
                  keyboardType: TextInputType.number,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
