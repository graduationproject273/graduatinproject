class UserEntity {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String? mobile;
  final String role;

  UserEntity({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.mobile,
    required this.role,
  });
}
