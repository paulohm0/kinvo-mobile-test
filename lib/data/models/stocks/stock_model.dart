class StockModel {
  final int id;
  final String name;
  final String ticker;
  final double minimumValue;
  final double profitability;

  StockModel({
    required this.id,
    required this.name,
    required this.ticker,
    required this.minimumValue,
    required this.profitability,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'],
      name: json['name'],
      ticker: json['ticker'],
      minimumValue: (json['minimumValue'] as num).toDouble(),
      profitability: (json['profitability'] as num).toDouble(),
    );
  }
}
