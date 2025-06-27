import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';

class ButtonsInDetailsPage extends StatefulWidget {
  const ButtonsInDetailsPage({super.key, required this.productentity});
  final ProductEntity productentity;

  @override
  State<ButtonsInDetailsPage> createState() => _ButtonsInDetailsPageState();
}

class _ButtonsInDetailsPageState extends State<ButtonsInDetailsPage>
    with TickerProviderStateMixin {
  bool _isFavorite = false;
  bool _isAddingToCart = false;
  late AnimationController _favoriteAnimationController;
  late AnimationController _cartAnimationController;
  late Animation<double> _favoriteScaleAnimation;
  late Animation<double> _cartScaleAnimation;

  @override
  void initState() {
    super.initState();
    _favoriteAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _cartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _favoriteScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(
      parent: _favoriteAnimationController,
      curve: Curves.elasticOut,
    ));
    
    _cartScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(
      parent: _cartAnimationController,
      curve: Curves.easeInOut,
    ));
    
    
  }

  @override
  void dispose() {
    _favoriteAnimationController.dispose();
    _cartAnimationController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    
    if (_isFavorite) {
      _favoriteAnimationController.forward();
    } else {
      _favoriteAnimationController.reverse();
    }
    
    // Show confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Row(
            children: [
              Icon(
                _isFavorite ? Icons.favorite : Icons.heart_broken,
                color: Colors.white,
                size: 20.w,
              ),
              SizedBox(width: 12.w),
              Text(
                _isFavorite ? 'Product added to favorites!' : 'Product removed from favorites',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: _isFavorite ? Colors.red[600] : Colors.grey[600],
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(16.w),
      ),
    );
  }

  void _addToCart() {
    if (_isAddingToCart) return;
    
    setState(() {
      _isAddingToCart = true;
    });
    
    _cartAnimationController.forward().then((_) {
      _cartAnimationController.reverse();
    });

    context.read<CartCubit>().addToCart(
      CartEntity(
        productId: widget.productentity.id,
        quantity: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        setState(() {
          _isAddingToCart = false;
        });
        
        if (state is AddtoCartLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.white,
                        size: 20.w,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Product added successfully!',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'You can now continue shopping or complete your order',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.green[600],
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.all(16.w),
              action: SnackBarAction(
                label: 'View Cart',
                textColor: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.2),
                onPressed: () {
                  // Navigate to cart page
                  // Navigator.pushNamed(context, '/cart');
                },
              ),
            ),
          );
        } 
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Favorite button
            AnimatedBuilder(
              animation: _favoriteAnimationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _favoriteScaleAnimation.value,
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      gradient: _isFavorite
                          ? LinearGradient(
                              colors: [
                                Colors.red[400]!,
                                Colors.red[600]!,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : LinearGradient(
                              colors: [
                                Colors.grey[200]!,
                                Colors.grey[300]!,
                              ],
                            ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: _isFavorite 
                            ? Colors.red.withOpacity(0.3)
                            : Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: _toggleFavorite,
                        child: Center(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_border,
                              key: ValueKey(_isFavorite),
                              color: _isFavorite ? Colors.white : Colors.grey[600],
                              size: 24.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            
            SizedBox(width: 16.w),
            
            // Add to cart button
            Expanded(
              child: AnimatedBuilder(
                animation: _cartAnimationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _cartScaleAnimation.value,
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                           maincolor,
                           maincolor.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: _isAddingToCart ? null : _addToCart,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_isAddingToCart) ...[
                                  SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    'Adding...',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ] else ...[
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                    size: 22.w,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}