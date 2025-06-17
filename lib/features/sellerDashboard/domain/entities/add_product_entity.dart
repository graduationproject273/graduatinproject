class AddProductEntity {
  final String name;
  final double price;
  final String description;
  final double sellingPrice; // Default value
  final double discount;
  final String? image;
  final int categoryId;

  final double quantityAvailable;
  final bool specialOffer;
  final String hardwareSpecifications;

  AddProductEntity( {required this.discount,
    required this.sellingPrice,
    required this.name,
    required this.price,
    required this.description,
    this.image,
    required this.categoryId,
    required this.quantityAvailable,
    required this.specialOffer,
    required this.hardwareSpecifications,
  });
}
