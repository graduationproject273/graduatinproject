import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  AddProductModel({
    required String name,
    required double price,
    required String description,
    String? image,
    required int categoryId,
    required double quantityAvailable,
    required bool specialOffer,
    required String hardwareSpecifications,
    required double sellingPrice,
    required double discount,
  }) : super(
          name: name,
          price: price,
          description: description,
          image: image,
          categoryId: categoryId,
          quantityAvailable: quantityAvailable,
          specialOffer: specialOffer,
          hardwareSpecifications: hardwareSpecifications,
          sellingPrice: sellingPrice,
          discount: discount,
        );

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      categoryId: json['category']['id'],
      quantityAvailable: json['quantityAvailable'],
      specialOffer: json['specialOffer'],
      hardwareSpecifications: json['hardwareSpecifications'],
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sellingPrice": sellingPrice,
      "discount": discount,
      "name": name,
      "price": price,
      "description": description,
      "image": image,
      "category": {
        "id": categoryId,
        
      },
      "quantityAvailable": quantityAvailable,
      "specialOffer": specialOffer,
      "hardwareSpecifications": hardwareSpecifications,
    };
  }
}
