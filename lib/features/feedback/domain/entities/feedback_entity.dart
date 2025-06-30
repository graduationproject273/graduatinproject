class FeedbackEntity {
  final int id;
  final UserEntity user;
  final ProductEntity product;
  final String? comment;
  final int rating;
  final DateTime createdAt;
  final String? image;

  const FeedbackEntity({
    required this.id,
    required this.user,
    required this.product,
    this.comment,
    required this.rating,
    required this.createdAt,
    this.image,
  });
}

class UserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}

class ProductEntity {
  final int id;
  final String name;

  const ProductEntity({
    required this.id,
    required this.name,
  });
}
