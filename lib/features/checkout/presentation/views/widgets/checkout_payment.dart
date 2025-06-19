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
            children: [
              const Icon(Icons.payment, color: Color(0xFF00917C)),
              const SizedBox(width: 8),
              const Text(
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
          RadioListTile<String>(
            value: 'card',
            groupValue: selectedPaymentMethod,
            onChanged: onChanged,
            title: Row(
              children: const [
                Icon(Icons.credit_card, color: Color(0xFF00917C), size: 20),
                SizedBox(width: 8),
                Text('Credit Card'),
              ],
            ),
            activeColor: const Color(0xFF00917C),
            contentPadding: EdgeInsets.zero,
          ),
          RadioListTile<String>(
            value: 'cash',
            groupValue: selectedPaymentMethod,
            onChanged: onChanged,
            title: Row(
              children: const [
                Icon(Icons.money, color: Color(0xFF00917C), size: 20),
                SizedBox(width: 8),
                Text('Cash on Delivery'),
              ],
            ),
            activeColor: const Color(0xFF00917C),
            contentPadding: EdgeInsets.zero,
          ),

          // Conditional fields
          if (selectedPaymentMethod == 'card') ...[
            const SizedBox(height: 16),
            TextFormField(
              controller: cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF00917C)),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: expiryController,
                    decoration: InputDecoration(
                      labelText: 'MM/YY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF00917C)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF00917C)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
