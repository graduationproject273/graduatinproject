// 📁 lib/features/seller/data/models/seller_summary_model.dart

import '../../domain/entities/seller_summary_entity.dart';

class SellerSummaryModel extends SellerSummaryEntity {
  const SellerSummaryModel({
    required int totalOrders,
    required int totalItemsSold,
    required num totalEarnings,
    required int sellerId,
    String? sellerName,
  }) : super(
          totalOrders: totalOrders,
          totalItemsSold: totalItemsSold,
          totalEarnings: totalEarnings,
          sellerId: sellerId,
          sellerName: sellerName,
        );

  factory SellerSummaryModel.fromJson(Map<String, dynamic> json) {
    return SellerSummaryModel(
      totalOrders: json['totalOrders'] ?? 0,
      totalItemsSold: json['totalItemsSold'] ?? 0,
      totalEarnings: json['totalEarnings'] ?? 0,
      sellerId: json['sellerId'],
      sellerName: json['sellerName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalOrders': totalOrders,
      'totalItemsSold': totalItemsSold,
      'totalEarnings': totalEarnings,
      'sellerId': sellerId,
      'sellerName': sellerName,
    };
  }
}
