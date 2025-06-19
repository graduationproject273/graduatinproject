import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:gradution/features/orders/presentation/widgets/order_card.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrdersCubit>()..getAllOrders(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: const Text(
            'Orders',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor:maincolor,
          elevation: 2,
          centerTitle: true,
        ),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoaded) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: state.orders.length,
    itemBuilder: (context, index) {
      return OrderCard(order: state.orders[index]);
    },
    
  );
}else if (state is OrdersError) {
  return Center(child: Text(state.message));
}
else{
  return const Center(child: CircularProgressIndicator());
}
          },
          
        ),
      ),
    );
  }
}



