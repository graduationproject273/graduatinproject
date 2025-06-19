import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/checkout/presentation/cubit/cubit/checkout_cubit.dart';
import 'package:gradution/features/checkout/presentation/views/widgets/checkout_address.dart';
import 'package:gradution/features/checkout/presentation/views/widgets/checkout_payment.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF00917C),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: context.read<CheckoutCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Summary
              Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shopping_cart, color: Color(0xFF00917C)),
              SizedBox(width: 8),
              Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildOrderItem('Modern 3-Seat Sofa', 1, 2500.00),
          _buildOrderItem('Wooden Coffee Table', 1, 850.00),
          _buildOrderItem('Decorative Pillow', 2, 120.00),
          Divider(height: 20),
          _buildSummaryRow('Subtotal', 3590.00),
          _buildSummaryRow('Shipping', 50.00),
          _buildSummaryRow('Tax', 182.00),
          Divider(height: 20),
          Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: TextStyle(
              fontSize: true ? 16 : 14,
              fontWeight: true ? FontWeight.bold : FontWeight.normal,
              color: true ? Colors.black87 : Colors.grey[700],
            ),
          ),
          Text(
            '\$${3822.00.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: true ? 16 : 14,
              fontWeight: FontWeight.bold,
              color: true ? Color(0xFF00917C) : Colors.black87,
            ),
          ),
        ],
      ),
    ),
        ],
      ),
    ),
              SizedBox(height: 20),
              
              // Delivery Address
              CheckoutAddress(
                addressController: context.read<CheckoutCubit>().addressController,
                 saveAddress: context.read<CheckoutCubit>().saveAddress,
                  onSaveAddressChanged: (bool? value) {  
                    if (value != null) {
                      context.read<CheckoutCubit>().toggleSaveAddress(value);
                    }
                  },),
              SizedBox(height: 20),
              
              // Payment Method
        BlocConsumer<CheckoutCubit, CheckoutState>(
  listener: (context, state) {
    if (state is CheckoutError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  builder: (context, state) {
    final cubit = context.read<CheckoutCubit>();

    return CheckoutPayment(
      cardNumberController: cubit.cardNumberController,
      expiryController: cubit.expiryController,
      cvvController: cubit.cvvController,
      selectedPaymentMethod: cubit.paymentMethod, // ✅ هنا صح
      onChanged: (String? value) {
        if (value != null) {
          cubit.setPaymentMethod(value); // ✅ تحديث الحالة
        }
      },
    );
  },
),

              SizedBox(height: 20),
              _buildCheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  

  Widget _buildOrderItem(String name, int quantity, double price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.chair, color: Color(0xFF00917C)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Quantity: $quantity',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00917C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black87 : Colors.grey[700],
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: FontWeight.bold,
              color: isTotal ? Color(0xFF00917C) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

 

 

  Widget _buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          if (context.read<CheckoutCubit>().formKey.currentState!.validate()) {
            _showOrderConfirmation();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF00917C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Confirm Order - \$3,822.00',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF00917C), size: 30),
              SizedBox(width: 8),
              Text('Order Confirmed'),
            ],
          ),
          content: Text(
            'Thank you! Your order has been confirmed successfully. We will contact you soon to confirm the delivery date.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFF00917C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

