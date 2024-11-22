import 'package:spectre_app/core/models/persona_model.dart';

class UserModel {
  int? id;
  String? email;
  String? password;
  String? role;
  PersonaModel? persona;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.role,
    this.persona,
    this.createdAt,
    this.updatedAt
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    persona = json['persona'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}