import 'package:flutter/material.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/features/cart/presentation/widgets/item_cart.dart';

// ignore: camel_case_types
class listItemsCarts extends StatelessWidget {
  const listItemsCarts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .6,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ItemCart(),
          );
        },
      ),
    );
  }
}

