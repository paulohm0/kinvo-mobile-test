import 'package:dio/dio.dart';
import 'package:kinvo_mobile_test/data/models/funds/fund_model.dart';

class FundsDatasource {
  final Dio dio;

  FundsDatasource(this.dio);

  Future<List<FundModel>> getFunds() async {
    try {
      final response = await dio.get('/funds');
      final List<dynamic> data = response.data['data'];
      return data.map((item) => FundModel.fromJson(item)).toList();
    } catch (error) {
      throw Exception('Erro ao buscar fundos: $error');
    }
  }
}
