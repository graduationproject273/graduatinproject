import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';

class Containerindrawer extends StatelessWidget {
  Containerindrawer({
    super.key,
  });

  final List<IconData> iconss = [
    Icons.man_outlined,
    Icons.production_quantity_limits,
    CupertinoIcons.cart_fill,
    CupertinoIcons.cart_badge_plus,
    CupertinoIcons.phone_fill,
        Icons.favorite,
     Icons.wifi_1_bar_outlined, // أيقونة AI
    Icons.local_offer_outlined
  ];

  final List<String> titles = [
    'Add Seller',
    'Products',
    'Carts',
    'Orders',
    'Contact Us',
    'Favorites',
    "Use Ai"
    "Offers"
   
  ];

  // دالة لتحديد الصفحة بناءً على الـ index
  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(Routes.signupseller);
        break;
      case 1:
       GoRouter.of(context).push(Routes.products);
        break;
      case 2:
        GoRouter.of(context).push(Routes.cart);
        break;
      case 3:
         GoRouter.of(context).push(Routes.ordersview);
        break;
      case 4:
        GoRouter.of(context).push(Routes.service);
        break;
        case 5:
        GoRouter.of(context).push(Routes.favorite);
        break;
      case 6:
        GoRouter.of(context).push(Routes.ocr);
        break;
      case 7:
        GoRouter.of(context).push(Routes.service);
      default:
         GoRouter.of(context).push(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // ignore: deprecated_member_use
          colors: [maincolor, maincolor.withOpacity(0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h), // استخدام .h لجعل الارتفاع متجاوبًا
            Column(
              children: [
                Image.asset(
                  Assets.imagesAvatar,
                  width: 70.w, // استخدام .w لجعل العرض متجاوبًا
                  height: 70.h, // استخدام .h لجعل الارتفاع متجاوبًا
                ),
                SizedBox(width: 20.w), // استخدام .w لجعل العرض متجاوبًا
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 16.sp), // استخدام .sp لجعل حجم الخط متجاوبًا
                ),
                Text(
                  'ashrafmahmoud@gmail.com',
                  style: TextStyle(fontSize: 14.sp), // استخدام .sp لجعل حجم الخط متجاوبًا
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h), // استخدام .w و .h لجعل الـ margin متجاوبًا
              width: double.infinity,
              height: 500.h, // استخدام .h لجعل الارتفاع متجاوبًا
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 8.w, bottom: 5.h, top: 3.h, left: 8.w), // استخدام .w لجعل الـ margin متجاوبًا
                  child: ListTile(
                    title: Text(
                      titles[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp, // استخدام .sp لجعل حجم الخط متجاوبًا
                      ),
                    ),
                    leading: Icon(
                      iconss[index],
                      color: Colors.white,
                      size: 20.sp, // استخدام .sp لجعل حجم الأيقونة متجاوبًا
                    ),
                    onTap: () {
                      navigateToPage(context, index);
                    },
                  ),
                ),
                itemCount: iconss.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}