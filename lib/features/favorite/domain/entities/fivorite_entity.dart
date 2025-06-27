class FavoriteEntity {
  final int id;
  final ProductEntity product;

  const FavoriteEntity({
    required this.id,
    required this.product,
  });
}

class ProductEntity {
  final int id;
  final String name;
  final int price;
  final int sellingPrice;
  final String description;
  final String image;
  final int quantityAvailable;
  final bool specialOffer;
  final String hardwareSpecifications;
  final int discountPrice;
  final CategoryEntity category;
  final SellerEntity seller;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.sellingPrice,
    required this.description,
    required this.image,
    required this.quantityAvailable,
    required this.specialOffer,
    required this.hardwareSpecifications,
    required this.discountPrice,
    required this.category,
    required this.seller,
  });
}

class CategoryEntity {
  final int id;
  final String name;
  final String description;
  final String image;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
}

class SellerEntity {
  final int id;
  final String name;
  final String mobile;
  final String mail;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final String swiftCode;
  final String tin;

  const SellerEntity({
    required this.id,
    required this.name,
    required this.mobile,
    required this.mail,
    required this.bankAccountNumber,
    required this.bankAccountHolderName,
    required this.swiftCode,
    required this.tin,
  });
}
