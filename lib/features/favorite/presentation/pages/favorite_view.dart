import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:gradution/features/favorite/presentation/widgets/favoritre_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteCubit>()..getAllFavourites(),
      child: FavoritreViewBody(),
    );
  }
}
