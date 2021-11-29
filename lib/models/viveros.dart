// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ViveroModel productoModelFromJson(String str) =>
    ViveroModel.fromJson(json.decode(str));

String productoModelToJson(ViveroModel data) => json.encode(data.toJson());

class ViveroModel {
  String id;
  String nombre;
  String tipo;
  String distrito;
  String provincia;
  String direccion;
  String telefono;
  String representante;

  ViveroModel({
    this.id = '',
    this.nombre = '',
    this.tipo = '',
    this.distrito = '',
    this.provincia = '',
    this.direccion = '',
    this.telefono = '',
    this.representante = '',
  });

  factory ViveroModel.fromJson(Map<String, dynamic> json) => new ViveroModel(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        distrito: json["distrito"],
        provincia: json["provincia"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        representante: json["representante"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "distrito": distrito,
        "provincia": provincia,
        "direccion": direccion,
        "telefono": telefono,
        "representante": representante,
      };
}
