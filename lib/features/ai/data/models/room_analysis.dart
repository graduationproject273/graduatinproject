import 'package:gradution/features/ai/data/models/recomedmodel.dart';

class RoomAnalysisModel {
  final List<String> detectedObjects;
  final List<RecommendationModel> recommendations;

  RoomAnalysisModel({
    required this.detectedObjects,
    required this.recommendations,
  });

  factory RoomAnalysisModel.fromJson(Map<String, dynamic> json) {
    return RoomAnalysisModel(
      detectedObjects: List<String>.from(json['detectedObjects'] ?? []),
      recommendations: (json['recommendations'] as List? ?? [])
          .map((e) => RecommendationModel.fromJson(e))
          .toList(),
    );
  }

  
  RoomAnalysisModel copyWith({
    List<String>? detectedObjects,
    List<RecommendationModel>? recommendations,
  }) {
    return RoomAnalysisModel(
      detectedObjects: detectedObjects ?? this.detectedObjects,
      recommendations: recommendations ?? this.recommendations,
    );
  }
  
}