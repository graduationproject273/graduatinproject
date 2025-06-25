import 'package:flutter/material.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({
    super.key,
    required this.cardNumberController,
    required this.expiryController,
    required this.cvvController,
    required this.selectedPaymentMethod,
    required this.onChanged,
  });

  final TextEditingController cardNumberController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;

  final String selectedPaymentMethod;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.payment, color: Color(0xFF00917C)),
              SizedBox(width: 8),
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ✅ فقط Stripe
          RadioListTile<String>(
            value: 'stripe',
            groupValue: selectedPaymentMethod,
            onChanged: onChanged,
            title: Row(
              children: const [
                Icon(Icons.payment, color: Color(0xFF00917C), size: 20),
                SizedBox(width: 8),
                Text('Stripe'),
              ],
            ),
            activeColor: const Color(0xFF00917C),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
