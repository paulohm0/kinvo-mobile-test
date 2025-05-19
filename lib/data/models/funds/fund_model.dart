class FundModel {
  final int id;
  final String name;
  final String type;
  final double minimumValue;
  final int rating;
  final double profitability;
  final int status;

  FundModel({
    required this.id,
    required this.name,
    required this.type,
    required this.minimumValue,
    required this.rating,
    required this.profitability,
    required this.status,
  });

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      minimumValue: (json['minimumValue'] as num).toDouble(),
      rating: json['rating'],
      profitability: (json['profitability'] as num).toDouble(),
      status: json['status'],
    );
  }
}
