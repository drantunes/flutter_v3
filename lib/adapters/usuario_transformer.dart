import 'dart:convert';

import 'package:flutter_v3/models/usuario.dart';

class UsuarioTransformer {
  static String toJson(Usuario usuario) => json.encode(toMap(usuario));

  static Usuario fromJson(String source) => fromMap(json.decode(source));

  static Map<String, dynamic> toMap(Usuario usuario) {
    return {
      'name': usuario.name,
      'email': usuario.email,
    };
  }

  static Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }
}
