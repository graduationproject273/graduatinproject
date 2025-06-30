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
  
  // دالة محسنة لفتح الروابط
  Future<void> _launchStripeUrl(String url) async {
    try {
      // تنظيف الرابط من المسافات أو الرموز الغريبة
      final cleanUrl = url.trim();
      print('Attempting to launch URL: $cleanUrl');
      
      final uri = Uri.parse(cleanUrl);
      
      // التحقق من صحة الرابط
      if (!uri.hasScheme || uri.host.isEmpty) {
        throw Exception('Invalid URL format');
      }
      
      // إغلاق لوحة المفاتيح أولاً
      FocusScope.of(context).unfocus();
      
      // انتظار قصير للسماح للواجهة بالاستقرار
      await Future.delayed(const Duration(milliseconds: 300));
      
      // محاولة فتح الرابط بطرق مختلفة
      bool launched = false;
      
      // الطريقة الأولى: فتح في متصفح خارجي
      if (await canLaunchUrl(uri)) {
        launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
      
      // الطريقة الثانية: إذا فشلت الأولى، جرب مع معاملات أخرى
      if (!launched) {
        launched = await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
      }
      
      // الطريقة الثالثة: جرب مع webViewConfiguration
      if (!launched) {
        launched = await launchUrl(
          uri,
          mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
            enableDomStorage: true,
          ),
        );
      }
      
      if (!launched) {
        throw Exception('Could not launch URL with any method');
      }
      
    } catch (e) {
      print('Error launching URL: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في فتح رابط الدفع: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<CheckoutCubit>().items = widget.cartItems
        .map((cartItem) => ItemOrderModel(
              id: cartItem.productcartentity.id,
              quantity: cartItem.quantity,
            ))
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
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
            if (state.order is OrdersDetailsEntity) {
              context
                  .read<GetordersCubit>()
                  .addOrderLocally(state.order as OrdersDetailsEntity);
            }

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم إضافة الطلب بنجاح!')),
            );

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
                  // استخدام الدالة المحسنة
                  await _launchStripeUrl(url);
                }
              } else if (paymentState is PaymentsError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('خطأ في Stripe: ${paymentState.message}'),
                    backgroundColor: Colors.red,
                  ),
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
                            await checkoutCubit.checkout(
                              paymentMethod: checkoutCubit.paymentMethod,
                              shippingAddress: checkoutCubit.addressController.text,
                              items: checkoutCubit.items,
                            );

                            await Future.delayed(const Duration(milliseconds: 100));

                            if (checkoutCubit.state is CheckoutSuccess &&
                                checkoutCubit.paymentMethod == 'stripe') {
                              
                              final successState = checkoutCubit.state as CheckoutSuccess;

                              int? orderId;
                              if (successState.order is OrdersDetailsEntity) {
                                orderId = (successState.order as OrdersDetailsEntity).id;
                              } else if (successState.order.id != null) {
                                orderId = successState.order.id is int
                                    ? successState.order.id as int
                                    : int.tryParse(successState.order.id.toString());
                              }

                              await paymentsCubit.createCheckoutSession(
                                amount: (totalAmount * 100).round(),
                                orderId: orderId ?? 0,
                                currency: 'USD',
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('خطأ: ${e.toString()}'),
                                backgroundColor: Colors.red,
                              ),
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
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'تأكيد الطلب',
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