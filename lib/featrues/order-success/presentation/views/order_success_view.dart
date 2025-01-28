import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/featrues/order-success/presentation/views/widgets/list_item_orders.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order ',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),

        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 25.sp,)),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listItemsOrders(),
      ),
    );
  }
}

