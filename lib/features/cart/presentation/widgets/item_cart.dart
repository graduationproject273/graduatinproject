import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/presentation/widgets/row_increment_and_decrement_number.dart';


class ItemCart extends StatelessWidget {
  final CartItemEntity product;
  
  const ItemCart({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: context.height * .16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // التعامل الآمن مع تحميل الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.productcartentity.image.isNotEmpty ? product.productcartentity.image : 'https://via.placeholder.com/100',
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100.w,
                      height: 100.h,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[600],
                        size: 40,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 100.w,
                      height: 100.h,
                      color: Colors.grey[300],
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productcartentity.name.isNotEmpty ? product.productcartentity.name : 'Unknown Product',
                        style: Textstyles.textitemcart,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$${product.productcartentity.price.toStringAsFixed(2)}',
                        style: Textstyles.textitemcart,
                      ),
                      // عرض وصف المنتج إذا كان متوفراً
                      if (product.productcartentity.description != null && product.productcartentity.description!.isNotEmpty)
                        Text(
                          product.productcartentity.description!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      rowIncrementAndDecrementNumber(),
                    ],
                  ),
                ),
              ),
              
              IconButton(
                onPressed: () {
                  // إضافة منطق الحذف هنا
                },
                icon: Icon(
                  CupertinoIcons.delete,
                  size: 25.sp,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
