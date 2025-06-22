import 'package:gradution/features/cart/domain/entities/category_cart_entity.dart';

class CategoryCartModel extends CategoryCartEntity {
  CategoryCartModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory CategoryCartModel.fromJson(Map<String, dynamic> json) {
    return CategoryCartModel(
      id: _parseToInt(json['id']),
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
    );
  }

  // Helper method للتحويل الآمن
  static int _parseToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }

}