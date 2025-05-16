import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://6266f62263e0f382568936e4.mockapi.io',
          connectTimeout: const Duration(
            seconds: 10,
          ), // tempo para conseguir abrir conexão com o servidor.
          receiveTimeout: const Duration(
            seconds: 10,
          ), // tempo para receber os dados depois que a conexão foi feita.
          headers: {'Content-Type': 'application/json'},
          // sobre o headers ...
          // Algumas APIs rejeitam a requisição ou retornam erro porque
          // não sabem como interpretar o que você mandou.
          // Mesmo em GET, é boa prática garantir que o formato esperado seja seguido.
        ),
      );
}
