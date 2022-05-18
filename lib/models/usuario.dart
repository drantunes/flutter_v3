class Usuario {
  String? id;
  String name;
  String email;
  String? avatar;

  Usuario({
    this.id,
    required this.name,
    required this.email,
    this.avatar,
  });
}
