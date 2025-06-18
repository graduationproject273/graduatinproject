class UserProfileEntity {
  final int id;
  final int userId;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String firstname;
  final String lastname;
  final String email;
  final String? mobile;
  final dynamic addresses;
  final dynamic seller;

  const UserProfileEntity({
    required this.id,
    required this.userId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.mobile,
    this.addresses,
    this.seller,
  });
}
