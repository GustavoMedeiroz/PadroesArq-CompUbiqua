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

  FinancialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cashInflow = json['cashInflow'];
    cashOutflow = json['cashInflow'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}