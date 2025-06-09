import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/row_image_text.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/row_text_icon.dart';

class ListviewOrders extends StatelessWidget {
  const ListviewOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with your order item count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  RowTextAndIcon(
                    index: index,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RowimageText()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


