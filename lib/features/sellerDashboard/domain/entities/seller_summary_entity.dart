// 📁 lib/features/seller/domain/entities/seller_summary_entity.dart

import 'package:equatable/equatable.dart';

class SellerSummaryEntity extends Equatable {
  final int totalOrders;
  final int totalItemsSold;
  final num totalEarnings;
  final int sellerId;
  final String? sellerName;

  const SellerSummaryEntity({
    required this.totalOrders,
    required this.totalItemsSold,
    required this.totalEarnings,
    required this.sellerId,
    this.sellerName,
  });

  @override
  List<Object?> get props => [
        totalOrders,
        totalItemsSold,
        totalEarnings,
        sellerId,
        sellerName,
      ];
}
