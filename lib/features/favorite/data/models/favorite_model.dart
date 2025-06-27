import 'package:gradution/features/favorite/domain/entities/fivorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    required super.id,
    required ProductModel super.product,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: _parseToInt(json['id']),
      product: json['product'] != null 
          ? ProductModel.fromJson(json['product']) 
          : ProductModel.empty(), // You'll need to create this
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
      id: _parseToInt(json['id']),
      name: json['name'] ?? '',
      price: _parseToInt(json['price']),
      sellingPrice: _parseToInt(json['sellingPrice']),
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      quantityAvailable: _parseToInt(json['quantityAvailable']),
      specialOffer: json['specialOffer'] ?? false,
      hardwareSpecifications: json['hardwareSpecifications'] ?? '',
      discountPrice: _parseToInt(json['discountPrice']),
      category: json['category'] != null 
          ? CategoryModel.fromJson(json['category']) 
          : CategoryModel.empty(),
      seller: json['seller'] != null 
          ? SellerModel.fromJson(json['seller']) 
          : SellerModel.empty(),
    );
  }

  // Empty constructor for handling null cases
  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      name: '',
      price: 0,
      sellingPrice: 0,
      description: '',
      image: '',
      quantityAvailable: 0,
      specialOffer: false,
      hardwareSpecifications: '',
      discountPrice: 0,
      category: CategoryModel.empty(),
      seller: SellerModel.empty(),
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
      id: _parseToInt(json['id']),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // Empty constructor for handling null cases
  factory CategoryModel.empty() {
    return CategoryModel(
      id: 0,
      name: '',
      description: '',
      image: '',
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
      id: _parseToInt(json['id']),
      name: json['name'] ?? '',
      mobile: json['mobile'] ?? '',
      mail: json['mail'] ?? '',
      bankAccountNumber: json['bankAccountNumber'] ?? '',
      bankAccountHolderName: json['bankAccountHolderName'] ?? '',
      swiftCode: json['swiftCode'] ?? '',
      tin: json['tin'] ?? '',
    );
  }

  // Empty constructor for handling null cases
  factory SellerModel.empty() {
    return SellerModel(
      id: 0,
      name: '',
      mobile: '',
      mail: '',
      bankAccountNumber: '',
      bankAccountHolderName: '',
      swiftCode: '',
      tin: '',
    );
  }
}

// Helper functions for type conversion
int _parseToInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}
