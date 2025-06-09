import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/features/order-success/presentation/views/widgets/list_item_orders.dart';

import '../../../../core/widgets/custom_appbar.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'Order',actions:  [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 25.sp,)),
        ],) ,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listItemsOrders(),
      ),
    );
  }
}

