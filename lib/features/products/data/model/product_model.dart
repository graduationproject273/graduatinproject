
import 'package:gradution/features/products/data/model/sub_model/Seller_model.dart';
import 'package:gradution/features/products/domain/entities/product_entity.dart';
import 'package:gradution/features/products/domain/entities/sub_entities/category_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.description,
    required super.image,
    required super.quantityAvailable,
    required super.specialOffer,
    required super.hardwareSpecifications,
    required super.category,
    required super.seller,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        description: json['description'],
        image: json['image'],
        quantityAvailable: json['quantityAvailable'],
        specialOffer: json['specialOffer'],
        hardwareSpecifications: json['hardwareSpecifications'],
        category: CategoryModel.fromJson(json['category']),
        seller: SellerModel.fromJson(json['seller']),
      );
       Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'description': description,
    'image': image,
    'quantityAvailable': quantityAvailable,
    'specialOffer': specialOffer,
    'hardwareSpecifications': hardwareSpecifications,
    'category': (category as CategoryModel).toJson(),
    'seller': (seller as SellerModel).toJson(),
  };
}

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(id: json['id'], name: json['name']);


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}







