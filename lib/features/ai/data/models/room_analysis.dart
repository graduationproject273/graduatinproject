import 'package:gradution/features/ai/data/models/recomedmodel.dart';

class RoomAnalysisModel {
  final List<String> detectedObjects;
  final List<RecommendationModel> recommendations;
  final String image;

  RoomAnalysisModel({
    required this.detectedObjects,
    required this.recommendations,
    required this.image,
  });

  factory RoomAnalysisModel.fromJson(Map<String, dynamic> json) {
    return RoomAnalysisModel(
      detectedObjects: List<String>.from(json['detectedObjects'] ?? []),
      recommendations: (json['recommendations'] as List<dynamic>?)
              ?.map((item) => RecommendationModel.fromJson(item))
              .toList() ??
          [],
      image: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'detectedObjects': detectedObjects,
      'recommendations': recommendations.map((item) => item.toJson()).toList(),
      'imageUrl': image,
    };
  }

  RoomAnalysisModel copyWith({
    List<String>? detectedObjects,
    List<RecommendationModel>? recommendations,
    String? image,
  }) {
    return RoomAnalysisModel(
      detectedObjects: detectedObjects ?? this.detectedObjects,
      recommendations: recommendations ?? this.recommendations,
      image: image ?? this.image,
    );
  }
}