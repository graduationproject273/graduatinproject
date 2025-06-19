import 'package:flutter/material.dart';
import 'package:gradution/features/cart/domain/entities/cart_item_entity.dart';

class OrderSummery extends StatelessWidget {
 final List<CartItemEntity> cartItems ;
  const OrderSummery({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
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
       ListView.builder(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         itemCount: cartItems.length,
         itemBuilder: (BuildContext context, int index) {
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
                  cartItems[index].productcartentity.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Quantity: ${cartItems[index].quantity}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
           cartItems[index].productcartentity.price.toString(),
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
}