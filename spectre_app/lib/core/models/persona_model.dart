class PersonaModel {
  int? id;
  String? name;
  String? taxId;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;

  PersonaModel({
    this.id,
    this.name,
    this.taxId,
    this.phone,
    this.createdAt,
    this.updatedAt
  });

  PersonaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    taxId = json['taxId'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}