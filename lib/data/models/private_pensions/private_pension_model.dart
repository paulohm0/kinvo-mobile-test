class PrivatePensionModel {
  final int id;
  final String name;
  final String type;
  final int minimumValue;
  final num tax;
  final int redemptionTerm;
  final num profitability;

  PrivatePensionModel({
    required this.id,
    required this.name,
    required this.type,
    required this.minimumValue,
    required this.tax,
    required this.redemptionTerm,
    required this.profitability,
  });

  factory PrivatePensionModel.fromJson(Map<String, dynamic> json) {
    return PrivatePensionModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      minimumValue: json['minimumValue'],
      tax: json['tax'],
      redemptionTerm: json['redemptionTerm'],
      profitability: json['profitability'],
    );
  }
}
