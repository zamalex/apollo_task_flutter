
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Network {
  final Dio _dio = Dio();
  static const BASE_URL = 'https://run.mocky.io/v3';
  static const ITEMS_URL = '/1e4653d5-a07a-4f1f-b2c8-b8ca6011b675';
  static const DETAILS_URL = '/36de2f10-fb80-4853-b501-28a4bbef03a4';

  Network(){
    init(BASE_URL);
    debugPrint('network initialized');
  }

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