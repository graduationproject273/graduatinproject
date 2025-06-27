
import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    required super.id,
    required ProductModel super.product,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      product: ProductModel.fromJson(json),
    );
  }
}

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.sellingPrice,
    required super.description,
    required super.image,
    required super.quantityAvailable,
    required super.specialOffer,
    required super.hardwareSpecifications,
    required super.discountPrice,
    required CategoryModel super.category,
    required SellerModel super.seller,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      sellingPrice: json['sellingPrice'],
      description: json['description'],
      image: json['image'],
      quantityAvailable: json['quantityAvailable'],
      specialOffer: json['specialOffer'],
      hardwareSpecifications: json['hardwareSpecifications'],
      discountPrice: json['discountPrice'],
      category: CategoryModel.fromJson(json['category']),
      seller: SellerModel.fromJson(json['seller']),
    );
  }
}

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}

class SellerModel extends SellerEntity {
  SellerModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.mail,
    required super.bankAccountNumber,
    required super.bankAccountHolderName,
    required super.swiftCode,
    required super.tin,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      mail: json['mail'],
      bankAccountNumber: json['bankAccountNumber'],
      bankAccountHolderName: json['bankAccountHolderName'],
      swiftCode: json['swiftCode'],
      tin: json['tin'],
    );
  }
}
