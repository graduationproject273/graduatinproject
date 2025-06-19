/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class RowTextAndIcon extends StatelessWidget {
  const RowTextAndIcon({
    super.key,
    required this.index,
  });
  final int index; // Example index, you can replace it with your own logic
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            color: maincolor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(
              Icons.electric_bolt,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          children: [
            Text(
              'Order #${index + 1}',
              style: Textstyles.textitemcart.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: maincolor),
            ),
            Text(
              'Order #${index + 1}',
              style: Textstyles.textitemcart.copyWith(
                  fontSize: 10.sp,
                  //  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400),
            )
          ],
        ),
      ],
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/enums/status.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/orders_details_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/getorders/getorders_cubit.dart';

class RowTextAndIcon extends StatefulWidget {
  const RowTextAndIcon({
    super.key,
    required this.order,
  });

  final OrdersDetailsEntity order;

  @override
  State<RowTextAndIcon> createState() => _RowTextAndIconState();
}

class _RowTextAndIconState extends State<RowTextAndIcon> {
  late OrderItemStatus selectedStatus;

  @override
  void initState() {
    super.initState();
    // استخدم القيمة مباشرة بدلًا من المقارنة
    selectedStatus = widget.order.status;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: maincolor.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Icon(
                Icons.electric_bolt,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.order.productName,
                  style: Textstyles.textitemcart.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: maincolor),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Qty: ${widget.order.quantity} | Price: ${widget.order.unitPrice} EGP',
                  style: Textstyles.textitemcart.copyWith(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Subtotal: ${widget.order.subtotal} EGP',
                  style: Textstyles.textitemcart.copyWith(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status: ${selectedStatus.name}',
                      style: Textstyles.textitemcart.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black87,
                      ),
                    ),
                    DropdownButton<OrderItemStatus>(
                      value: selectedStatus,
                      underline: const SizedBox(),
                      dropdownColor: Colors.white,
                      style: Textstyles.textitemcart.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                      items: OrderItemStatus.values.map((status) {
                        return DropdownMenuItem<OrderItemStatus>(
                          value: status,
                          child: Text(
                            status.name,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (status) {
                        if (status != null) {
                          setState(() {
                            selectedStatus = status;
                          });

                          // تغيير الحالة ثم إعادة التحميل
                          context
                              .read<GetordersCubit>()
                              .changeStatusOrder(widget.order.id, status.name)
                              .then((_) {
                            context.read<GetordersCubit>().getorders();
                          });
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
