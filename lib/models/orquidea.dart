// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

OrquideaModel origenModelFromJson(String str) =>
    OrquideaModel.fromJson(json.decode(str));

String productoModelToJson(OrquideaModel data) => json.encode(data.toJson());

class OrquideaModel {
  String id;
  String nombre;
  String origen;
  String especie;
  String familia;
  String tipo;
  String hubicacion;
  String duracion;

  OrquideaModel({
    this.id = '',
    this.nombre = '',
    this.origen = '',
    this.especie = '',
    this.familia = '',
    this.tipo = '',
    this.hubicacion = '',
    this.duracion = '',
  });

  factory OrquideaModel.fromJson(Map<String, dynamic> json) =>
      new OrquideaModel(
        id: json["id"],
        nombre: json["nombre"],
        origen: json["origen"],
        especie: json["especie"],
        familia: json["familia"],
        tipo: json["tipo"],
        hubicacion: json["hubicacion"],
        duracion: json["duracion"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "nombre": nombre,
        "origen": origen,
        "especie": especie,
        "familia": familia,
        "tipo": tipo,
        "hubicacion": hubicacion,
        "duracion": duracion,
      };
}
