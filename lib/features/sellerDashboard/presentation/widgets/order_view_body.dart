import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/getorders/getorders_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/listview_orders.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<GetordersCubit>();

    // نجيب الداتا فقط لو مش متحملة قبل كدا
    if (cubit.state is! GetordersLoaded) {
      cubit.getorders();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              // ✅ عدد الطلبات بناءً على الحالة
              BlocBuilder<GetordersCubit, GetordersState>(
                builder: (context, state) {
                  if (state is GetordersLoaded) {
                    return Text(
                      'Total Orders: ${state.ordersList.length}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    );
                  } else {
                    return const SizedBox(); // فارغ لو مش لوديد
                  }
                },
              ),

              const SizedBox(height: 8),

              Expanded(
                child: BlocConsumer<GetordersCubit, GetordersState>(
                  listener: (context, state) {
                    if (state is GetordersError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMessage)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GetordersLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetordersLoaded) {
                      return ListviewOrders(orders: state.ordersList);
                    } else {
                      return const Center(child: Text('No orders found'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
