import 'package:flutter/material.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';

class OrderSummery extends StatelessWidget {
  final List<CartItemEntity> cartItems;
  const OrderSummery({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final double subtotal = _calculateSubtotal();
    const double shipping = 50.0;
    final double tax = subtotal * 0.05; // مثلاً 5% ضريبة
    final double total = subtotal + shipping + tax;

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
            children: const [
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
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              final item = cartItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
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
                            item.productcartentity.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Quantity: ${item.quantity}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${(item.productcartentity.price * item.quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00917C),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(height: 20),
          _buildSummaryRow('Subtotal', subtotal),
          _buildSummaryRow('Shipping', shipping),
          _buildSummaryRow('Tax', tax),
          const Divider(height: 20),
          _buildSummaryRow('Total', total, isTotal: true),
        ],
      ),
    );
  }

  double _calculateSubtotal() {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + (item.productcartentity.price * item.quantity),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
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
}
