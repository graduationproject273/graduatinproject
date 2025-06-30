import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
         GoRouter.of(context).push(Routes.orderDetails, extra: order);
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // رأس البطاقة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order # ${order.id}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00917C),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor(order.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: getStatusColor(order.status),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 4),
                        Text(
                          order.status,
                          style: TextStyle(
                            color: getStatusColor(order.status),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
      
              // معلومات العميل والوقت
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    order.userEmail,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.access_time,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatTime(order.orderDate),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
      
              // الأصناف
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: order.orderItems.map((item) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00917C).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.product.name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF00917C),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
      
              // الإجمالي
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${order.totalAmount.toStringAsFixed(2)} EGP',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00917C),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return 'since ${difference.inMinutes} minute';
    } else if (difference.inHours < 24) {
      return 'since ${difference.inHours} hours';
    } else {
      return 'since ${difference.inDays} Day';
    }
  }

  Color getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return Colors.amber;
      case 'PROCESSING':
        return Colors.blue;
      case 'SHIPPED':
        return Colors.deepPurple;
      case 'DELIVERED':
        return Colors.green;
      case 'CANCELLED':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
