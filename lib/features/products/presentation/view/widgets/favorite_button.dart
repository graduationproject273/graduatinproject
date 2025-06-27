import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/favorite/presentation/cubit/favorite_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteCubit>()..isFavourite(id),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              gradient: state is FavoriteIsTrue
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
                  color: state is FavoriteIsTrue
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
                onTap: () {
                  if (state is FavoriteIsTrue) {
                    context.read<FavoriteCubit>().removeFromFavourite(id);
                  } else {
                    context.read<FavoriteCubit>().addToFavourite(id);
                  }
                  context.read<FavoriteCubit>().isFavourite(id);
                },
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                     state is FavoriteIsTrue? Icons.favorite : Icons.favorite_border,
                      key: ValueKey<bool>(state is FavoriteIsTrue),
                      color: state is FavoriteIsTrue ? Colors.white : Colors.grey[600],
                      size: 24.w,
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
}
