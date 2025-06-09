import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/databases/api/interceptors.dart';
import 'package:gradution/core/databases/api/status_codes.dart';
import 'package:gradution/core/errors/expentions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options
      ..baseUrl = EndPoints.baserUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCodes.serverError;

    dio.interceptors.add(LoggerInterceptor());
    //dio.interceptors.add(di.sl<LogInterceptor>());
  }

//!POST
  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      dio.post(
        path,
        
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!GET
  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res =
          await dio.get(path, data: data, queryParameters: queryParameters,
           );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!DELETE
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!PATCH
  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
