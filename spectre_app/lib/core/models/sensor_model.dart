class SensorModel {
  int? id;
  String? name;
  String? currentValue;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SensorModel({
    this.id,
    this.name,
    this.currentValue,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt
  });

  SensorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currentValue = json['currentValue'];
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'currentValue': currentValue,
      'type': type,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}