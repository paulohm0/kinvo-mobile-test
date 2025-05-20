import 'package:dio/dio.dart';
import 'package:kinvo_mobile_test/data/models/private_pensions/private_pension_model.dart';

class PrivatePensionsDatasource {
  final Dio dio;

  PrivatePensionsDatasource(this.dio);

  Future<List<PrivatePensionModel>> getPensions() async {
    try {
      final response = await dio.get('/pension');
      final List<dynamic> data = response.data['data'];
      return data.map((item) => PrivatePensionModel.fromJson(item)).toList();
    } catch (error) {
      throw Exception('Erro ao buscar previdências: $error');
    }
  }
}
