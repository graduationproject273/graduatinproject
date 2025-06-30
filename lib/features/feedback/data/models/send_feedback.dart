class FeedbackSimpleModel {
  final String comment;
  final int rating;
  final String? image;

  const FeedbackSimpleModel({
    required this.comment,
    required this.rating,
    this.image,
  });


  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'rating': rating,
      'image': image,
    };
  }

 
}
