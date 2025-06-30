import 'package:gradution/features/feedback/domain/entities/feedback_entity.dart';

class FeedbackModel extends FeedbackEntity {
  const FeedbackModel({
    required super.id,
    required super.user,
    required super.product,
    super.comment,
    required super.rating,
    required super.createdAt,
    super.image,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    final productJson = json['product'];

    return FeedbackModel(
      id: json['id'],
      user: UserEntity(
        id: userJson['id'],
        firstName: userJson['firstname'],
        lastName: userJson['lastname'],
        email: userJson['email'],
      ),
      product: ProductEntity(
        id: productJson['id'],
        name: productJson['name'],
      ),
      comment: json['comment'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['createdAt']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': {
        'id': user.id,
        'firstname': user.firstName,
        'lastname': user.lastName,
        'email': user.email,
      },
      'product': {
        'id': product.id,
        'name': product.name,
      },
      'comment': comment,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
      'image': image,
    };
  }
}
