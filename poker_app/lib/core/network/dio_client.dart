import 'package:dio/dio.dart';
import 'package:poker_app/core/network/pokeapi_endpoint.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: PokeApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  Dio get client => _dio;
}
