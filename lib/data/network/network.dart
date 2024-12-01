
import 'package:dio/dio.dart';

class Network {
  final Dio _dio = Dio();

  init(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  Future<Response> get(String url) async {
    try {
      return await _dio.get(url);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}