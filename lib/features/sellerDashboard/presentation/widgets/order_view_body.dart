import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/getorders/getorders_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/listview_orders.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Orders ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Total Orders: 10',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              // Add your order details here
              // For example, you can use ListView to display order items
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
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is GetordersLoaded) {
                      return ListviewOrders(orders: state.ordersList,);
                    } else {
                      return Center(child: Text('No orders found'));
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
