import 'package:gradution/features/sellerDashboard/domain/entities/get_all_category_entity.dart';

class GetAllCategoryModel extends GetAllCategoryEntity {
  GetAllCategoryModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetAllCategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "image": image,
    };
  }
}
