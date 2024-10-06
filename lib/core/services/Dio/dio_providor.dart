import 'package:bookia_app/core/constants/auth_constants.dart';
import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';

class DioProvidor {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30)));
  }

  static Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    return await _dio.post(endPoint,
        data: data, queryParameters: data, options: Options(headers: headers));
  }

  static Future<Response> get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(endPoint, queryParameters: queryParameters);
  }

  static Future<Response> delete(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    return await _dio.delete(endPoint, queryParameters: queryParameters);
  }

  static Future<Response> put(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(endPoint, queryParameters: queryParameters);
  }
}
