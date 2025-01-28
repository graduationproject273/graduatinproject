import 'package:flutter/material.dart';
import 'package:gradution/featrues/order-success/presentation/views/widgets/item_order.dart';

// ignore: camel_case_types
class listItemsOrders extends StatelessWidget {
  const listItemsOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return itemOrder();
      },
    );
  }
}

