class SensorModel {
  int? id;
  String? name;
  double? minValue;
  double? maxValue;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SensorModel({
    this.id,
    this.name,
    this.minValue,
    this.maxValue,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt
  });

  SensorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    minValue = json['minValue'];
    maxValue = json['maxValue'];
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
    updatedAt = json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'minValue': minValue,
      'maxValue': maxValue,
      'type': type,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}