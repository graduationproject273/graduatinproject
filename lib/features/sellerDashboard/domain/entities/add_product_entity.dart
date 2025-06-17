
class AddProductEntity {
  final String name;
  final double price;
  final double sellingPrice;
  final String description;
  final String image;
  final int quantityAvailable;
  final bool specialOffer;
  final String hardwareSpecifications;
  final double? discountPrice;
  final CategoryEntity category;

  const AddProductEntity({
    required this.name,
    required this.price,
    required this.sellingPrice,
    required this.description,
    required this.image,
    required this.quantityAvailable,
    required this.specialOffer,
    required this.hardwareSpecifications,
    this.discountPrice,
    required this.category,
  });
}

class CategoryEntity {
  final int id;
 

  const CategoryEntity({
    required this.id,
   
  });
}
