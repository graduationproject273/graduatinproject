import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/favorite/presentation/cubit/favorite_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.id,
    this.size,
  });

  final int id;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteCubit>()..isFavourite(id),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          // Handle any side effects here if needed
          if (state is FavoriteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? 'An error occurred'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isFavorite = state is FavoriteIsTrue;
          final isLoading = state is FavoriteLoading;
          final buttonSize = size ?? 60.w;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              gradient: isFavorite
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
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: isFavorite
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
                onTap: isLoading
                    ? null
                    : () {
                        _handleFavoriteToggle(context, isFavorite);
                      },
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              isFavorite ? Colors.white : Colors.grey[600]!,
                            ),
                          ),
                        )
                      : AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            key: ValueKey<bool>(isFavorite),
                            color: isFavorite ? Colors.white : Colors.grey[600],
                            size: (buttonSize * 0.4).clamp(20.0, 30.0),
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

  void _handleFavoriteToggle(BuildContext context, bool isFavorite) {
    final cubit = context.read<FavoriteCubit>();
    
    // Use the new toggle method for better handling
    //cubit.toggleFavorite(id);
  }
}

// Alternative version with better state management
class FavoriteButtonV2 extends StatefulWidget {
  const FavoriteButtonV2({
    super.key,
    required this.id,
    this.size,
    this.onFavoriteChanged,
  });

  final int id;
  final double? size;
  final Function(bool isFavorite)? onFavoriteChanged;

  @override
  State<FavoriteButtonV2> createState() => _FavoriteButtonV2State();
}

class _FavoriteButtonV2State extends State<FavoriteButtonV2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteCubit>()..isFavourite(widget.id),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteIsTrue || state is FavoriteIsFalse) {
            _animationController.forward().then((_) {
              _animationController.reverse();
            });
            
            if (widget.onFavoriteChanged != null) {
              widget.onFavoriteChanged!(state is FavoriteIsTrue);
            }
          }
        },
        builder: (context, state) {
          final isFavorite = state is FavoriteIsTrue;
          final isLoading = state is FavoriteLoading;
          final buttonSize = widget.size ?? 60.w;

          return AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    gradient: isFavorite
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
                              Colors.grey[100]!,
                              Colors.grey[200]!,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: isFavorite
                            ? Colors.red.withOpacity(0.4)
                            : Colors.grey.withOpacity(0.3),
                        blurRadius: isFavorite ? 12 : 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isFavorite
                          ? Colors.red.withOpacity(0.3)
                          : Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: isLoading
                          ? null
                          : () => _handleFavoriteToggle(context, isFavorite),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: isFavorite
                          ? Colors.red.withOpacity(0.3)
                          : Colors.grey.withOpacity(0.3),
                      child: Center(
                        child: isLoading
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isFavorite ? Colors.white : Colors.grey[600]!,
                                  ),
                                ),
                              )
                            : AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) {
                                  return RotationTransition(
                                    turns: animation,
                                    child: ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),
                                  );
                                },
                                child: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  key: ValueKey<bool>(isFavorite),
                                  color: isFavorite ? Colors.white : Colors.grey[700],
                                  size: (buttonSize * 0.4).clamp(20.0, 30.0),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _handleFavoriteToggle(BuildContext context, bool isFavorite) {
    final cubit = context.read<FavoriteCubit>();
    
    if (isFavorite) {
      cubit.removeFromFavourite(widget.id);
    } else {
      cubit.addToFavourite(widget.id);
    }
  }
}