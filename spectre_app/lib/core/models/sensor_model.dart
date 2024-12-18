import 'package:equatable/equatable.dart';

class SensorModel extends Equatable {
  final int id;
  final String name;
  final double currentValue;
  final double minValue;
  final double maxValue;
  final String type;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SensorModel({
    required this.id,
    required this.name,
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SensorModel.fromJson(Map<String, dynamic> json) {
    return SensorModel(
      id: json['id'],
      name: json['name'],
      currentValue: json['currentValue'] ?? 0.0,
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      type: json['type'],
      status: json['status'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'currentValue': currentValue,
      'minValue': minValue,
      'maxValue': maxValue,
      'type': type,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        minValue,
        maxValue,
        type,
        status,
        createdAt,
        updatedAt,
      ];
}
