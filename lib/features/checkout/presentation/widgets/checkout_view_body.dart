import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/checkout/data/item_oreder_model.dart';
import 'package:gradution/features/checkout/presentation/cubit/cubit/checkout_cubit.dart';
import 'package:gradution/features/checkout/presentation/widgets/checkout_address.dart';
import 'package:gradution/features/checkout/presentation/widgets/checkout_payment.dart';
import 'package:gradution/features/checkout/presentation/widgets/order_summery.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItemEntity> cartItems;
  const CheckoutPage({super.key, required this.cartItems});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    context.read<CheckoutCubit>().items = widget.cartItems
        .map((cartItem) => ItemOrderModel(
              id: cartItem.productcartentity.id,
              quantity: cartItem.quantity,
            ))
        .toList();
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: context.read<CheckoutCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderSummery(cartItems: widget.cartItems),
            // Delivery Address
            CheckoutAddress(
              addressController:
                  context.read<CheckoutCubit>().addressController,
              saveAddress: context.read<CheckoutCubit>().saveAddress,
              onSaveAddressChanged: (bool? value) {
                if (value != null) {
                  context.read<CheckoutCubit>().toggleSaveAddress(value);
                }
              },
            ),
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
    );
  }

  Widget _buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          if (context.read<CheckoutCubit>().formKey.currentState!.validate()) {
            context.read<CheckoutCubit>().checkout(
                  paymentMethod: context.read<CheckoutCubit>().paymentMethod,
                  shippingAddress:
                      context.read<CheckoutCubit>().addressController.text,
                  items: context.read<CheckoutCubit>().items,
                );
            print(context.read<CheckoutCubit>().items[0].id);
         //   _showOrderConfirmation();
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
