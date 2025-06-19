import 'package:flutter/material.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/orders_details_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/row_text_icon.dart';

class ListviewOrders extends StatelessWidget {
  const ListviewOrders({
    super.key,
    required this.orders,
  });

  final List<OrdersDetailsEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  RowTextAndIcon(order: order),
                
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
