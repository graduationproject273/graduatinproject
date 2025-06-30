/*import 'package:cached_network_image/cached_network_image.dart';
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
}*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/get_product_seller_cubit/get_product_seller_cubit.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productEntity,
    this.onFavoritePressed,
    this.showFavoriteButton = true,
    this.onTap,
  });

  final ProductEntity productEntity;
  final VoidCallback? onFavoritePressed;
  final bool showFavoriteButton;
  final VoidCallback? onTap;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with SingleTickerProviderStateMixin {
  bool _isDeleting = false;
  late final bool _isSeller;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _isSeller = _checkIfSeller();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _checkIfSeller() {
    final roles = CacheHelper().getDataString(key: 'roles');
    return roles?.contains("ROLE_SELLER") ?? false;
  }

  void _handleProductTap() async {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    await Future.delayed(const Duration(milliseconds: 100));

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
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
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
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 10,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.exclamationmark_triangle,
                color: Colors.red,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Delete Product',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'Are you sure you want to delete "${widget.productEntity.name}"?\n\nThis action cannot be undone.',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14.sp,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 2,
            ),
            child: Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
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
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: GestureDetector(
                onTap: _handleProductTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.grey.shade50,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: 270 / 150,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: _buildProductImage(),
                                  ),
                                ),
                                SizedBox(height: 12.h),
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
                        _buildGradientOverlay(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductImage() {
    return Hero(
      tag: 'product_image_${widget.productEntity.id}',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: widget.productEntity.image ?? '',
            width: context.width * 0.6,
            height: context.width * 0.6,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade300,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade300,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.photo,
                    size: 40.sp,
                    color: Colors.grey[500],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'No Image',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      widget.productEntity.name,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
        height: 1.3,
        letterSpacing: -0.2,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductPrice() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            maincolor,
            maincolor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: maincolor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        '${widget.productEntity.price} EGP',
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Positioned(
      top: 12.h,
      left: 12.w,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isDeleting ? null : _handleDelete,
          borderRadius: BorderRadius.circular(25.r),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey.shade50,
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _isDeleting
                ? SizedBox(
                    width: 20.sp,
                    height: 20.sp,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : Icon(
                    CupertinoIcons.delete_solid,
                    size: 20.sp,
                    color: Colors.red[600],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.02),
            ],
            stops: const [0.0, 0.7, 1.0],
          ),
        ),
      ),
    );
  }
}