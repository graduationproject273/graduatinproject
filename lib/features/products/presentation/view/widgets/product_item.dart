import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/cubit/get_product_seller_cubit.dart';

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

      onTap: () {
        final roles = CacheHelper().getDataString(key: 'roles');
        if (roles!.contains("ROLE_SELLER")) {
          GoRouter.of(context).push(Routes.sellerProductsEdit,
              extra: productEntity);
        } else {
          GoRouter.of(context)
              .push(Routes.productDetails, extra: productEntity);
        }
      },
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
                  // صورة المنتج في المنتصف
                  Center(
                    child: SizedBox(
                      width: itemWidth * 0.5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 12.w), // المسافات باستخدام ScreenUtil
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: itemWidth * 0.05,
                            ),
                            Image.network(
                              productEntity.image!,
                              width: itemWidth * 0.4,
                              height: itemWidth * 0.3,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              productEntity.name,
                              style: TextStyle(
                                fontSize: 14.sp, // زيادة حجم الخط بشكل مرن
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                              ),
                              maxLines: 1, // منع تجاوز النص
                            ),
                            SizedBox(
                                height: 5.h), // زيادة المسافة بين الاسم والسعر
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

             CacheHelper().getDataString(key: 'roles')!.contains("ROLE_SELLER")?       Positioned(
                    top: 0,
                    left: itemWidth * 0.05,
                    child: IconButton(
                      onPressed: () {
                    context.read<GetProductSellerCubit>().deleteProduct(productEntity.id);
                      },
                      icon: Icon(
                        CupertinoIcons.delete,
                        size: 25.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ):Container(),
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
