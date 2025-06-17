import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  const AddProductModel({
    required super.name,
    required super.price,
    required super.sellingPrice,
    required super.description,
    required super.image,
    required super.quantityAvailable,
    required super.specialOffer,
    required super.hardwareSpecifications,
    super.discountPrice,
    required CategoryModel super.category,
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      quantityAvailable: json['quantityAvailable'],
      specialOffer: json['specialOffer'],
      hardwareSpecifications: json['hardwareSpecifications'],
      discountPrice: json['discountPrice'] != null
          ? (json['discountPrice'] as num).toDouble()
          : null,
      category: CategoryModel.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'sellingPrice': sellingPrice,
    'description': description,
    'image': image,
    'quantityAvailable': quantityAvailable,
    'specialOffer': specialOffer,
    'hardwareSpecifications': hardwareSpecifications,
    'discountPrice': discountPrice,
    'category': (category as CategoryModel).toJson(),
  };
}
  

  class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
 
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
     
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
   
  };
}