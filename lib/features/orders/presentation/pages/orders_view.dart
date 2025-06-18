import 'package:flutter/material.dart';

// نموذج الطلب
class Order {
  final String id;
  final String customerName;
  final double totalAmount;
  final DateTime orderDate;
  final OrderStatus status;
  final List<String> items;

  Order({
    required this.id,
    required this.customerName,
    required this.totalAmount,
    required this.orderDate,
    required this.status,
    required this.items,
  });
}

// حالات الطلب
enum OrderStatus {
  pending,
  confirmed,
  preparing,
  ready,
  delivered,
  cancelled,
}

// امتداد لترجمة حالات الطلب
extension OrderStatusExtension on OrderStatus {
  String get arabicName {
    switch (this) {
      case OrderStatus.pending:
        return 'في انتظار التأكيد';
      case OrderStatus.confirmed:
        return 'مؤكد';
      case OrderStatus.preparing:
        return 'قيد التحضير';
      case OrderStatus.ready:
        return 'جاهز للاستلام';
      case OrderStatus.delivered:
        return 'تم التسليم';
      case OrderStatus.cancelled:
        return 'ملغي';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.confirmed:
        return const Color(0xFF00917C);
      case OrderStatus.preparing:
        return Colors.blue;
      case OrderStatus.ready:
        return Colors.green;
      case OrderStatus.delivered:
        return Colors.grey;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case OrderStatus.pending:
        return Icons.access_time;
      case OrderStatus.confirmed:
        return Icons.check_circle_outline;
      case OrderStatus.preparing:
        return Icons.restaurant;
      case OrderStatus.ready:
        return Icons.done_all;
      case OrderStatus.delivered:
        return Icons.local_shipping;
      case OrderStatus.cancelled:
        return Icons.cancel;
    }
  }
}

// صفحة الطلبات
class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // بيانات تجريبية للطلبات
  final List<Order> orders = [
    Order(
      id: 'ORD001',
      customerName: 'أحمد محمد',
      totalAmount: 125.50,
      orderDate: DateTime.now().subtract(const Duration(minutes: 30)),
      status: OrderStatus.preparing,
      items: ['برجر دجاج', 'بطاطس مقلية', 'كوكاكولا'],
    ),
    Order(
      id: 'ORD002',
      customerName: 'فاطمة أحمد',
      totalAmount: 85.00,
      orderDate: DateTime.now().subtract(const Duration(hours: 1)),
      status: OrderStatus.ready,
      items: ['بيتزا مارجريتا', 'عصير برتقال'],
    ),
    Order(
      id: 'ORD003',
      customerName: 'محمد علي',
      totalAmount: 95.75,
      orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      status: OrderStatus.delivered,
      items: ['شاورما لحم', 'سلطة', 'ماء'],
    ),
    Order(
      id: 'ORD004',
      customerName: 'سارة حسن',
      totalAmount: 156.25,
      orderDate: DateTime.now().subtract(const Duration(minutes: 15)),
      status: OrderStatus.confirmed,
      items: ['وجبة عائلية', 'أرز بخاري', 'شوربة عدس', 'سلطة فتوش'],
    ),
    Order(
      id: 'ORD005',
      customerName: 'عمر يوسف',
      totalAmount: 67.50,
      orderDate: DateTime.now().subtract(const Duration(minutes: 45)),
      status: OrderStatus.pending,
      items: ['ساندويش فلافل', 'عصير ليمون'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'الطلبات',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF00917C),
        elevation: 2,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshOrders,
        color: const Color(0xFF00917C),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return OrderCard(order: orders[index]);
          },
        ),
      ),
    );
  }

  Future<void> _refreshOrders() async {
    // محاكاة تحديث البيانات
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }
}

// بطاقة الطلب
class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  'طلب رقم: ${order.id}',
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
                    color: order.status.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: order.status.color,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        order.status.icon,
                        size: 16,
                        color: order.status.color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        order.status.arabicName,
                        style: TextStyle(
                          color: order.status.color,
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
                  order.customerName,
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
              'الأصناف:',
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
              children: order.items.map((item) {
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
                    item,
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
                  'المجموع:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${order.totalAmount.toStringAsFixed(2)} ج.م',
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
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else {
      return 'منذ ${difference.inDays} يوم';
    }
  }
}