import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/orders/domain/entities/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Routes.orderDetails, extra: order);
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.only(
          bottom: isSmallScreen ? 12 : 16,
          left: isSmallScreen ? 8 : 16,
          right: isSmallScreen ? 8 : 16,
        ),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // رأس البطاقة - responsive layout
              _buildHeader(context, isSmallScreen),
              SizedBox(height: isSmallScreen ? 8 : 12),
      
              // معلومات العميل والوقت - responsive layout
              _buildUserTimeInfo(context, isSmallScreen),
              SizedBox(height: isSmallScreen ? 8 : 12),
      
              // الأصناف
              _buildCategoriesSection(context, isSmallScreen),
              SizedBox(height: isSmallScreen ? 8 : 12),
      
              // الإجمالي
              _buildTotalAmount(context, isSmallScreen),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isSmallScreen) {
    if (isSmallScreen) {
      // في الشاشات الصغيرة، نضع العناصر عمودياً
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order # ${order.id}',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF00917C),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: _buildStatusChip(isSmallScreen),
          ),
        ],
      );
    } else {
      // في الشاشات الكبيرة، نضع العناصر أفقياً
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Order # ${order.id}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00917C),
              ),
            ),
          ),
          _buildStatusChip(isSmallScreen),
        ],
      );
    }
  }

  Widget _buildStatusChip(bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 8 : 12,
        vertical: isSmallScreen ? 4 : 6,
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
              fontSize: isSmallScreen ? 10 : 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTimeInfo(BuildContext context, bool isSmallScreen) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (isSmallScreen) {
      // في الشاشات الصغيرة، نضع المعلومات عمودياً
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  order.userEmail,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                _formatTime(order.orderDate),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      // في الشاشات الكبيرة، نضع المعلومات أفقياً
      return Row(
        children: [
          const Icon(
            Icons.person,
            size: 18,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              order.userEmail,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
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
      );
    }
  }

  Widget _buildCategoriesSection(BuildContext context, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: isSmallScreen ? 2 : 4),
        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              spacing: isSmallScreen ? 4 : 8,
              runSpacing: isSmallScreen ? 2 : 4,
              children: order.orderItems.map((item) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 8,
                    vertical: isSmallScreen ? 2 : 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00917C).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item.product.name,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 12,
                      color: const Color(0xFF00917C),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTotalAmount(BuildContext context, bool isSmallScreen) {
    if (isSmallScreen) {
      // في الشاشات الصغيرة، نضع السعر تحت النص
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Amount:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${order.totalAmount.toStringAsFixed(2)} EGP',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00917C),
            ),
          ),
        ],
      );
    } else {
      // في الشاشات الكبيرة، نضع السعر بجانب النص
      return Row(
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
      );
    }
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