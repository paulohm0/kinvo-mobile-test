import 'package:dio/dio.dart';
import 'package:kinvo_mobile_test/data/models/stocks/stock_model.dart';

class StockDatasource {
  final Dio dio;

  StockDatasource(this.dio);

  Future<List<StockModel>> getStocks() async {
    try {
      final response = await dio.get('/stocks');
      final List<dynamic> data = response.data['data'];
      return data.map((item) => StockModel.fromJson(item)).toList();
    } catch (error) {
      throw Exception('Erro ao buscar ações: $error');
    }
  }
}
