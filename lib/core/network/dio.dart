import 'package:dio/dio.dart';

class DioInstance {
  Dio? _dio;

  Dio get dio => _dio ?? _instantiate();

  Dio _instantiate() {
    _dio = Dio(
      BaseOptions(
        // baseUrl: "https://pages-back-dev.octa-apps.com/api/",
        baseUrl: "https://test.quantumgate.io/api/",
        receiveDataWhenStatusError: true,
      ),
    );

    _dio!.interceptors.add(
      LogInterceptor(
        responseHeader: false,
        requestHeader: false,
        requestBody: true,
        responseBody: true,
      ),
    );

    return _dio!;
  }
}
