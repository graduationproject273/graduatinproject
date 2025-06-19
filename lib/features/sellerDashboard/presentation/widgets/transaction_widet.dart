import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/sellerDashboard/presentation/widgets/table_payment_and_transaction.dart';

class TransactionWidet extends StatelessWidget {
  const TransactionWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Transactions',
          style: Textstyles.namereview,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
             children: [
              TablePaymentAndTransaction(rows: 5, columns: 5)
             ],
          )
        ),
      ),
    );
  }
}