import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';
import 'package:gradution/features/cart/presentation/widgets/row_increment_and_decrement_number.dart';


class ItemCart extends StatelessWidget {
  final CartItemEntity product;
  
  const ItemCart({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    print('ItemCart: ${product.productcartentity.image}');
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
                child: CachedNetworkImage(

                  imageUrl:   product.productcartentity.image.isNotEmpty ? product.productcartentity.image : 'https://via.placeholder.com/100',
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) {
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
                  placeholder: (context, url) => Container(
                    width: 100.w,
                    height: 100.h,
                    color: Colors.grey[300],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$${product.productcartentity.price.toStringAsFixed(2)}',
                        style: Textstyles.textitemcart,
                      ),
                      // عرض وصف المنتج إذا كان متوفراً
                      
                      RowIncrementAndDecrementNumber(id: product.id, quantity: product.quantity, onQuantityChanged: (newQuantity) {
                        // يمكنك هنا تنفيذ أي إجراء عند تغيير الكمية
                       
                      }
                      
                      ),
                    ],
                  ),
                ),
              ),
              
              IconButton(
                onPressed: () {
                context.read<CartCubit>().clearItemCart(product.id);
               

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
