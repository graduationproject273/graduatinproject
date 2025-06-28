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
      x: json['x'],
      y: json['y'],
      label: json['label'],
    );
  }
}
