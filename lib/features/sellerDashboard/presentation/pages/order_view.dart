import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/getorders/getorders_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider.value(
        value: sl<GetordersCubit>()..getorders(),
        child: OrderViewBody(),
      ),
    );
  }
}
