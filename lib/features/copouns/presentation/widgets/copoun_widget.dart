import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CouponWidget extends StatefulWidget {
  final double total;

  const CouponWidget({super.key, required this.total});

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  final TextEditingController _controller = TextEditingController();
  String? message;
  double? discount;
  bool isLoading = false;

  Future<void> validateCoupon(String code) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await Dio().get(
        'http://localhost:8080/api/coupons/validate',
        queryParameters: {'code': code},
      );

      final data = response.data;
      if (data['valid'] == true) {
        setState(() {
          discount = widget.total * (data['discountPercentage'] / 100);
          message = '✅ تم تطبيق الخصم بنجاح (${data['discountPercentage']}%)';
        });
      } else {
        setState(() {
          message = '❌ الكوبون غير صالح';
          discount = null;
        });
      }
    } catch (e) {
      setState(() {
        message = 'حدث خطأ أثناء التحقق ❌';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final discountedTotal = widget.total - (discount ?? 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'ادخل كود الخصم',
            suffixIcon: isLoading
                ? CircularProgressIndicator()
                : IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () => validateCoupon(_controller.text.trim()),
                  ),
          ),
        ),
        if (message != null) ...[
          SizedBox(height: 10),
          Text(
            message!,
            style: TextStyle(color: Colors.green, fontSize: 16),
          ),
        ],
        SizedBox(height: 10),
        Text(
          'الإجمالي: ${widget.total.toStringAsFixed(2)} جنيه',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        if (discount != null) ...[
          Text(
            'بعد الخصم: ${discountedTotal.toStringAsFixed(2)} جنيه',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ],
    );
  }
}
