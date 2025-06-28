class RecommendationModel {
  final int id;
  final String name;
  final int price;
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
    this.isAddedToCart = false, // default value
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: _toInt(json['id']),
      name: (json['name'] ?? '').toString(),
      price: _toInt(json['price']),
      image: (json['image'] ?? '').toString(),
      explanation: (json['explanation'] ?? '').toString(),
      placement: PlacementModel.fromJson(json['placement'] ?? {}),
      isAddedToCart: json['isAddedToCart'] == true, // safe boolean conversion
    );
  }

  RecommendationModel copyWith({
    int? id,
    String? name,
    int? price,
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
      x: _toInt(json['x']),
      y: _toInt(json['y']),
      label: (json['label'] ?? '').toString(),
    );
  }
}

/// تحويل آمن لأي قيمة إلى int
int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}