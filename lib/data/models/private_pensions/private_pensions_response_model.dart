import 'package:kinvo_mobile_test/data/models/private_pensions/private_pension_model.dart';

class PensionsResponseModel {
  final bool success;
  final List<PrivatePensionModel> data;
  final String? error;

  PensionsResponseModel({
    required this.success,
    required this.data,
    required this.error,
  });

  factory PensionsResponseModel.fromJson(Map<String, dynamic> json) {
    return PensionsResponseModel(
      success: json['success'],
      data:
          (json['data'] as List)
              .map((item) => PrivatePensionModel.fromJson(item))
              .toList(),
      error: json['error'],
    );
  }
}
