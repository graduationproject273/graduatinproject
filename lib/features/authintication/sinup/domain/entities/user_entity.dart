class UserEntity {
  final String email;
  final String password;
  final String? token;
  final List<String> roles;

  UserEntity({
    required this.email,
    required this.password,
    this.token,
    this.roles = const [],
  });
}
