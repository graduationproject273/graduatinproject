class RecommendationModel {
  final int id;
  final String name;
  final double price;
  final String image;
  final String explanation;
  final PlacementModel placement;
  final bool isAddedToCart;

  RecommendationModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.explanation,
    required this.placement,
    this.isAddedToCart = false,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
      explanation: json['explanation'] ?? '',
      placement: PlacementModel.fromJson(json['placement'] ?? {}),
      isAddedToCart: json['isAddedToCart'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'explanation': explanation,
      'placement': placement.toJson(),
      'isAddedToCart': isAddedToCart,
    };
  }

  RecommendationModel copyWith({
    int? id,
    String? name,
    double? price,
    String? image,
    String? explanation,
    PlacementModel? placement,
    bool? isAddedToCart,
  }) {
    return RecommendationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      explanation: explanation ?? this.explanation,
      placement: placement ?? this.placement,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
    );
  }
}

class PlacementModel {
  final int x;
  final int y;
  final String label;

  PlacementModel({
    required this.x,
    required this.y,
    required this.label,
  });

  factory PlacementModel.fromJson(Map<String, dynamic> json) {
    return PlacementModel(
      x: json['x'] ?? 0,
      y: json['y'] ?? 0,
      label: json['label'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
      'label': label,
    };
  }
}