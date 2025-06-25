import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';

class PricesInDetailsProduct extends StatelessWidget {
  const PricesInDetailsProduct({
    super.key,
    required this.oldPrice,
    required this.currentPrice,
    this.discountPercentage,
    this.showCurrency = true,
    this.currency = '\$',
  });

  final String oldPrice;
  final String currentPrice;
  final int? discountPercentage;
  final bool showCurrency;
  final String currency;

  bool get _hasDiscount => 
      oldPrice != currentPrice && 
      double.tryParse(oldPrice) != null && 
      double.tryParse(currentPrice) != null &&
      double.parse(oldPrice) > double.parse(currentPrice);

  int get _calculatedDiscountPercentage {
    if (!_hasDiscount) return 0;
    
    final old = double.parse(oldPrice);
    final current = double.parse(currentPrice);
    return ((old - current) / old * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current price
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                showCurrency ? '$currency$currentPrice' : currentPrice,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                  shadows: [
                    Shadow(
                      color: maincolor.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              if (_hasDiscount)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red[600]!,
                        Colors.red[400]!,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.white,
                        size: 14.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${discountPercentage ?? _calculatedDiscountPercentage}% OFF',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          
          if (_hasDiscount) ...[
            SizedBox(height: 8.h),
            // Old price
            Row(
              children: [
                Text(
                  'Original Price: ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: maincolor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  showCurrency ? '$currency$oldPrice' : oldPrice,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey[500],
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red[400],
                    decorationThickness: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.green[200]!,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.trending_down,
                        color: Colors.green[700],
                        size: 12.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'You Save ${currency}${(double.parse(oldPrice) - double.parse(currentPrice)).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 12.h),
            
            // Savings bar
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green[200]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: maincolor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.savings_outlined,
                      color: Colors.white,
                      size: 16.w,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Limited Offer!',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: maincolor,
                          ),
                        ),
                        Text(
                          'Buy now and get this special discount',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: maincolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.local_offer,
                    color: maincolor,
                    size: 20.w,
                  ),
                ],
              ),
            ),
          ] else ...[
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: maincolor.withOpacity( .150),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: maincolor.withOpacity( .5),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_outlined,
                    color: maincolor,
                    size: 16.w,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Best Price',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: maincolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}