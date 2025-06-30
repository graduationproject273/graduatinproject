import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/checkout/data/item_oreder_model.dart';
import 'package:gradution/features/checkout/presentation/cubit/cubit/checkout_cubit.dart';
import 'package:gradution/features/checkout/presentation/widgets/checkout_address.dart';
import 'package:gradution/features/checkout/presentation/widgets/checkout_payment.dart';
import 'package:gradution/features/checkout/presentation/widgets/order_summery.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/orders_details_entity.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/getorders/getorders_cubit.dart';
import 'package:gradution/features/payments/presentation/cubit/payments_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

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
            CheckoutAddress(
              addressController: context.read<CheckoutCubit>().addressController,
              saveAddress: context.read<CheckoutCubit>().saveAddress,
              onSaveAddressChanged: (bool? value) {
                if (value != null) {
                  context.read<CheckoutCubit>().toggleSaveAddress(value);
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<CheckoutCubit, CheckoutState>(
              buildWhen: (previous, current) =>
                  current is CheckoutPaymentMethodChanged,
              builder: (context, state) {
                final cubit = context.read<CheckoutCubit>();
                return CheckoutPayment(
                  cardNumberController: cubit.cardNumberController,
                  expiryController: cubit.expiryController,
                  cvvController: cubit.cvvController,
                  selectedPaymentMethod: cubit.paymentMethod,
                  onChanged: (String? value) {
                    if (value != null) {
                      cubit.setPaymentMethod(value);
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            _buildCheckoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutButton() {
    final totalAmount = widget.cartItems.fold<double>(
      0.0,
      (sum, item) =>
          sum + (item.productcartentity.price ?? 0.0) * (item.quantity ?? 0),
    );

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            // Add order locally only if it's a valid OrdersDetailsEntity
            if (state.order is OrdersDetailsEntity) {
              context
                  .read<GetordersCubit>()
                  .addOrderLocally(state.order as OrdersDetailsEntity);
            }

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Order added successfully!')),
            );

            // Navigate for cash payments
            if (context.read<CheckoutCubit>().paymentMethod != 'stripe') {
              GoRouter.of(context).push(Routes.ordersview);
            }
          } else if (state is CheckoutError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final checkoutCubit = context.read<CheckoutCubit>();
          final paymentsCubit = context.read<PaymentsCubit>();

          return BlocConsumer<PaymentsCubit, PaymentsState>(
            listener: (context, paymentState) async {
              if (paymentState is PaymentsLoaded) {
                final url = paymentState.session.url;
                if (url != null && url.isNotEmpty) {
                  try {
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw 'Could not launch $url';
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error opening payment URL: $e')),
                    );
                  }
                }
              } else if (paymentState is PaymentsError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Stripe Error: ${paymentState.message}')),
                );
              }
            },
            builder: (context, paymentState) {
              final isLoading = state is CheckoutLoading || paymentState is PaymentsLoading;

              return ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (checkoutCubit.formKey.currentState?.validate() ?? false) {
                          try {
                            // First, create the checkout/order
                            await checkoutCubit.checkout(
                              paymentMethod: checkoutCubit.paymentMethod,
                              shippingAddress: checkoutCubit.addressController.text,
                              items: checkoutCubit.items,
                            );

                            // Wait for the checkout state to update
                            await Future.delayed(Duration(milliseconds: 100));

                            // If Stripe payment and checkout was successful
                            if (checkoutCubit.state is CheckoutSuccess &&
                                checkoutCubit.paymentMethod == 'stripe') {
                              
                              final successState = checkoutCubit.state as CheckoutSuccess;
                              
                              // Get order ID from the successful checkout
                              int? orderId;
                              if (successState.order is OrdersDetailsEntity) {
                                orderId = (successState.order as OrdersDetailsEntity).id;
                              } else if (successState.order.id != null) {
                                orderId = successState.order.id is int 
                                    ? successState.order.id as int
                                    : int.tryParse(successState.order.id.toString());
                              }

                              await paymentsCubit.createCheckoutSession(
                                amount: (totalAmount * 100).round(), // Convert to cents
                                orderId: 120,
                                currency: 'USD',
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: ${e.toString()}')),
                            );
                          }
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00917C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.check_circle, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Confirm Order',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
              );
            },
          );
        },
      ),
    );
  }
}