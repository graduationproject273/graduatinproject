abstract class OptionalFeaturesEntity {
  final String option1;
  final String option2;

  OptionalFeaturesEntity({
    required this.option1,
    required this.option2,
  });
}

class OptionalFeaturesModel extends OptionalFeaturesEntity {
  OptionalFeaturesModel({
    required super.option1,
    required super.option2,
  });

  factory OptionalFeaturesModel.fromJson(Map<String, dynamic> json) {
    return OptionalFeaturesModel(
      option1: json['option1'] ?? '', // Provide default empty string
      option2: json['option2'] ?? '', // Provide default empty string
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option1': option1,
      'option2': option2,
    };
  }
}