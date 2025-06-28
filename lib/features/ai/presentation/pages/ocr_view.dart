import 'package:cloudinary/cloudinary.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/ai/data/repositories/ocr_Impl.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_cubit.dart';
import 'package:gradution/features/ai/presentation/widgets/ocr_widget.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';

class OcrScreen extends StatelessWidget {
  const OcrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dioConsumer = DioConsumer(dio: Dio());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CartCubit>()),
        BlocProvider(
          create: (context) => OcrCubit(
            OcrImpl(dioConsumer: dioConsumer),
            context.read<CartCubit>(),
          ),
        ),
      ],
      child: const OcrView(),
    );
  }
}
