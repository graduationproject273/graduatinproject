import 'package:flutter/material.dart';

class CheckoutAddress extends StatelessWidget {
  const CheckoutAddress({
    super.key,
    required this.addressController,
    required this.saveAddress,
    required this.onSaveAddressChanged,
  });

  final TextEditingController addressController;
  final bool saveAddress;
  final ValueChanged<bool?> onSaveAddressChanged;

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
              Icon(Icons.location_on, color: Color(0xFF00917C)),
              SizedBox(width: 8),
              Text(
                'Delivery Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              labelText: 'Detailed Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF00917C)),
              ),
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Checkbox(
                value: saveAddress,
                onChanged: onSaveAddressChanged,
                activeColor: const Color(0xFF00917C),
              ),
              const Text('Save this address for future orders'),
            ],
          ),
        ],
      ),
    );
  }
}
