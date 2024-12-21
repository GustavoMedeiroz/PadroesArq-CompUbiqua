class FinancialModel {
  int? id;
  double? cashInflow;
  double? cashOutflow;
  DateTime? createdAt;
  DateTime? updatedAt;

  FinancialModel({
    this.id,
    this.cashInflow,
    this.cashOutflow,
    this.createdAt,
    this.updatedAt
  });

  factory FinancialModel.fromJson(Map<String, dynamic> json) {
    return FinancialModel(
      id: json['id'],
      cashInflow: json['cashInflow'],
      cashOutflow: json['cashOutflow'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cashInflow': cashInflow,
      'cashOutflow': cashOutflow,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}