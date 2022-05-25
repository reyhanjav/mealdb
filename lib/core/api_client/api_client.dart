import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiClient {
  static const BASE_URL = 'https://www.themealdb.com/api/json/v1/1';
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 10000,
      receiveTimeout: 5000,
    ),
  );

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? headers,
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(Uri.encodeFull(endpoint),
          options: Options(headers: headers),
          cancelToken: cancelToken,
          queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
