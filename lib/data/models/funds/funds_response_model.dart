import 'package:kinvo_mobile_test/data/models/funds/fund_model.dart';

class FundsResponseModel {
  final bool success;
  final List<FundModel> data;
  final String? error;

  FundsResponseModel({
    required this.success,
    required this.data,
    required this.error,
  });

  factory FundsResponseModel.fromJson(Map<String, dynamic> json) {
    return FundsResponseModel(
      success: json['success'],
      data:
          (json['data'] as List)
              .map((item) => FundModel.fromJson(item))
              .toList(),
      error: json['error'],
    );
  }
}
