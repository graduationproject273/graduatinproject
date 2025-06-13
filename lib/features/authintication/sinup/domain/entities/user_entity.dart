class UserEntity {
  final String email;
  final String password;
  final String? token;

  UserEntity({
    required this.email,
    required this.password,
    this.token,
  });
}
