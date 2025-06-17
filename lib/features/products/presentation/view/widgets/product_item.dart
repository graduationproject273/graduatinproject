import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
    //  onTap: () {
     //   GoRouter.of(context).push(Routes.productDetails);
     // },
      child: Material(
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
           decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  //blurStyle: BlurStyle.normal,
                  color: Colors.black,
                  spreadRadius: 3,
                  blurRadius: 3,
        
                  offset: const Offset(0, 3),
                ),
              ]),
            child: AspectRatio(
              aspectRatio: 270 / 150,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: itemWidth * 0.05,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 25.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  // صورة المنتج في المنتصف
                  Center(
                    child: Container(
                      width: itemWidth * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productEntity.image??'http://res.cloudinary.com/doilrq33o/image/upload/v1750089972/de9vl2f9lwdnkzdc6ed3.png',),
                          fit: BoxFit.fill, // تأكيد تغطية الصورة للمساحة
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w), // المسافات باستخدام ScreenUtil
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // اسم المنتج
                            Text(
                              productEntity.name ,
                              style: TextStyle(
                                fontSize: 14.sp, // زيادة حجم الخط بشكل مرن
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                              ),
                              maxLines: 1, // منع تجاوز النص
                            ),
                            SizedBox(height: 5.h), // زيادة المسافة بين الاسم والسعر
                            // سعر المنتج
                            Text(
                              '${productEntity.price} EGP',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // تفاصيل المنتج
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
