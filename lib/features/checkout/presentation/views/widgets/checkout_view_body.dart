import 'package:flutter/material.dart';
import 'package:gradution/features/cart/domain/entities/cart_entity.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';
import 'package:gradution/features/checkout/presentation/views/widgets/order_summery.dart';

class CheckoutPage extends StatefulWidget {
 final List<CartItemEntity> cartItems;
  const CheckoutPage({super.key, required this.cartItems});

  @override
  // ignore: library_private_types_in_public_api
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPaymentMethod = 'card';
  String selectedAddress = 'home';
  bool saveAddress = false;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Summary
              OrderSummery(cartItems: widget.cartItems,),
              SizedBox(height: 20),

              // Delivery Address
              _buildDeliveryAddress(),
              SizedBox(height: 20),

              // Payment Method
              _buildPaymentMethod(),
              SizedBox(height: 20),
              _buildCheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
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
          _buildSummaryRow('Total', 3822.00, isTotal: true),
        ],
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

  Widget _buildDeliveryAddress() {
    return Container(
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
          SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFF00917C)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFF00917C)),
              ),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: 'Detailed Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFF00917C)),
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
          SizedBox(height: 12),
          Row(
            children: [
              Checkbox(
                value: saveAddress,
                onChanged: (value) {
                  setState(() {
                    saveAddress = value ?? false;
                  });
                },
                activeColor: Color(0xFF00917C),
              ),
              Text('Save this address for future orders'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
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
          SizedBox(height: 16),
          _buildPaymentOption('card', 'Credit Card', Icons.credit_card),
          _buildPaymentOption('cash', 'Cash on Delivery', Icons.money),
          if (selectedPaymentMethod == 'card') ...[
            SizedBox(height: 16),
            TextFormField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF00917C)),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _expiryController,
                    decoration: InputDecoration(
                      labelText: 'MM/YY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF00917C)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF00917C)),
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

  Widget _buildPaymentOption(String value, String title, IconData icon) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedPaymentMethod,
      onChanged: (String? value) {
        setState(() {
          selectedPaymentMethod = value!;
        });
      },
      title: Row(
        children: [
          Icon(icon, color: Color(0xFF00917C), size: 20),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
      activeColor: Color(0xFF00917C),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
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

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}
