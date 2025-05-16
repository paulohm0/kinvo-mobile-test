import 'package:kinvo_mobile_test/data/models/stocks/stock_model.dart';

class StocksResponseModel {
  final bool success;
  final List<StockModel> data;
  final String? error;

  StocksResponseModel({required this.success, required this.data, this.error});

  factory StocksResponseModel.fromJson(Map<String, dynamic> json) {
    return StocksResponseModel(
      success: json['success'],
      data:
          (json['data'] as List)
              .map((item) => StockModel.fromJson(item))
              .toList(),
      error: json['error'],
    );
  }
}
