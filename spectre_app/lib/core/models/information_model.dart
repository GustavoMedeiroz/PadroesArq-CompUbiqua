class InformationModel {
  String? title;
  int? sensorId;
  String? type;
  String? priority;
  DateTime? createdAt;
  DateTime? updatedAt;

  InformationModel({
    this.title,
    this.sensorId,
    this.type,
    this.priority,
    this.createdAt,
    this.updatedAt
  });

  InformationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sensorId = json['sensorId'];
    type = json['type'];
    priority = json['priority'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'sensorId': sensorId,
      'type': type,
      'priority': priority,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}