import 'package:flutter_test/flutter_test.dart';
import 'package:poker_app/core/network/dio_client.dart';
import 'package:poker_app/core/network/pokeapi_endpoint.dart';

void main() {
  group('DioClient', () {
    test('deve criar Dio com baseUrl e timeouts corretos', () {
      final dioClient = DioClient();
      final dio = dioClient.client;

      expect(dio.options.baseUrl, PokeApiEndpoints.baseUrl);
      expect(dio.options.connectTimeout, const Duration(seconds: 10));
      expect(dio.options.receiveTimeout, const Duration(seconds: 10));
    });
  });
}
