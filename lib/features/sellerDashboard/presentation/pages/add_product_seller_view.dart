import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/add_product_cubit/add_product_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/add_product_seller_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class AddProductSellerView extends StatelessWidget {
  const AddProductSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddProductCubit>(),
      child: BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
          return ModalProgressHUD(inAsyncCall: state is AddProductLoading,
          child: AddProductSellerViewBody());
        },
      ),
    );
  }
}
