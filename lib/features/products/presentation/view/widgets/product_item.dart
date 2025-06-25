import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/cubit/get_product_seller_cubit.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productEntity,
    this.onFavoritePressed,
    this.showFavoriteButton = true, this.onTap,
    
  });

  final ProductEntity productEntity;
  final VoidCallback? onFavoritePressed;
  final bool showFavoriteButton;
  final VoidCallback? onTap;


  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isDeleting = false;
  late final bool _isSeller;

  @override
  void initState() {
    super.initState();
    _isSeller = _checkIfSeller();
  }

  bool _checkIfSeller() {
    final roles = CacheHelper().getDataString(key: 'roles');
    return roles?.contains("ROLE_SELLER") ?? false;
  }

  void _handleProductTap() async {
  if (_isSeller) {
    final result = await context.push<bool>(
      Routes.sellerProductsEdit,
      extra: widget.productEntity,
    );

    if (result == true && mounted) {
      context.read<GetProductSellerCubit>().getAllProductfun();
    }
  } else {
    context.push(Routes.productDetails, extra: widget.productEntity);
  }
}


  Future<void> _handleDelete() async {
    final confirmed = await _showDeleteConfirmation();
    if (confirmed == true && mounted) {
      setState(() {
        _isDeleting = true;
      });

      try {
        await context
            .read<GetProductSellerCubit>()
            .deleteProduct(widget.productEntity.id);
        context
            .read<GetProductSellerCubit>()
            .removeProductLocally(widget.productEntity.id);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to delete product: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isDeleting = false;
          });
        }
      }
    }
  }

  Future<bool?> _showDeleteConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Delete Product',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${widget.productEntity.name}"?',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label:
          'Product: ${widget.productEntity.name}, Price: ${widget.productEntity.price} EGP',
      child: GestureDetector(
        onTap: _handleProductTap,
        child: Card(
          elevation: 4,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            child: AspectRatio(
              aspectRatio: 270 / 150,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: _buildProductImage(),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildProductName(),
                                _buildProductPrice(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_isSeller) _buildDeleteButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: CachedNetworkImage(
        imageUrl: widget.productEntity.image ?? '',
        width: context.width * 0.6,
        height: context.width * 0.6,
        fit: BoxFit.fill,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 32.sp,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      widget.productEntity.name,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        height: 1.2,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductPrice() {
    return Text(
      '${widget.productEntity.price} EGP',
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Positioned(
      top: 8.h,
      left: 8.w,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isDeleting ? null : _handleDelete,
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: _isDeleting
                ? SizedBox(
                    width: 20.sp,
                    height: 20.sp,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : Icon(
                    CupertinoIcons.delete,
                    size: 20.sp,
                    color: Colors.red[600],
                  ),
          ),
        ),
      ),
    );
  }
}
