// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String email;
  String password;
  // String distrito;
  // String provincia;
  // String direccion;
  // String telefono;
  // String representante;

  UserModel({
    this.id = '',
    this.email = '',
    this.password = '',
    // this.distrito = '',
    // this.provincia = '',
    // this.direccion = '',
    // this.telefono = '',
    // this.representante = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "email": email,
        "password": password,
      };
}
