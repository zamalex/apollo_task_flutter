
import 'package:apollo_task_flutter/data/network/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Network {
  final Dio _dio = Dio();

  Network(){
    init(URLs.BASE_URL);
    debugPrint('network initialized');
  }

  init(String baseUrl) {
    _dio.options.baseUrl = baseUrl;

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Called before request is sent
        print('Requesting: ${options.uri}');
        return handler.next(options); // Continue the request
      },
      onResponse: (response, handler) {
        // Called when the response is received
        print('Response: ${response.statusCode} ${response.data}');
        return handler.next(response); // Continue with the response
      },
      onError: (DioError e, handler) {
        // Handle errors globally here

        print('error is ${e.response!.statusCode}');

        // Call the error handler to pass the error to the app
        return handler.next(e); // Continue the error flow
      },
    ));
  }

  Future<Response> get(String url) async {
    try {
      return await _dio.get(url);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}