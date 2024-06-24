import 'package:dio/dio.dart';

import 'hive_helper.dart';

class DioHelper {
  static Dio? dio;
  static const String baseUrl = 'http://192.168.137.1/api/';
  // static const String baseUrl = 'http://127.0.0.1:8000/api/';
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        headers: {
          "Content-Type": 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    setHeaderToken(token: HiveHelper.getUserToken);
  }

  static void setHeaderToken({required String? token}) {
    if (token != null) {
      dio!.options.headers["Authorization"] = "Bearer $token";
    }
  }

  static void resetHeaderToken() => dio!.options.headers["Authorization"] = '';

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
