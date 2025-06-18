import 'package:gradution/features/home/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required int id,
    required int userId,
    required String? image,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String firstname,
    required String lastname,
    required String email,
    String? mobile,
    dynamic addresses,
    dynamic seller,
  }) : super(
          id: id,
          userId: userId,
          image: image,
          createdAt: createdAt,
          updatedAt: updatedAt,
          firstname: firstname,
          lastname: lastname,
          email: email,
          mobile: mobile,
          addresses: addresses,
          seller: seller,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      userId: json['userId'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      mobile: json['mobile'],
      addresses: json['addresses'],
      seller: json['seller'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'mobile': mobile,
      'addresses': addresses,
      'seller': seller,
    };
  }
}
