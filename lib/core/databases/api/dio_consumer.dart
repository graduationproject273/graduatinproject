import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:gradution/core/databases/api/api_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/databases/api/interceptors.dart';
import 'package:gradution/core/databases/api/status_codes.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';


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
  }

//!POST
 @override
  Future<Either<String, Response>> get({String? path, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path!, queryParameters: queryParameters);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

@override
Future<Either<String, Response>> post({
  Object? data,
  Map<String, String>? headers,
  bool isFormData = false,
  String? path,
  Map<String, dynamic>? queryParameters,
  Options? options, // ⬅️ خليه قابل للتمرير من بره
}) async {
  try {
    final token = CacheHelper().getData(key: 'token');

    // بناء الهيدر النهائي
    final requestHeaders = {
      if (!isFormData && (headers?['Content-Type'] == null)) 
        'Content-Type': 'application/json', // افتراضي فقط لو مش formData ومفيش header
      'Accept': 'application/json',
      if (token != null && token.isNotEmpty)
        'Authorization': 'Bearer $token',
      ...?headers,
    };

    final effectiveOptions = options?.copyWith(
      headers: requestHeaders,
      responseType: ResponseType.json,
      contentType: isFormData ? 'multipart/form-data' : 'application/json',
      validateStatus: (status) => status != null && status < 500,
    ) ?? Options(
      headers: requestHeaders,
      responseType: ResponseType.json,
      contentType: isFormData ? 'multipart/form-data' : 'application/json',
      validateStatus: (status) => status != null && status < 500,
    );

    final response = await dio.post(
      path!,
      data: data,
      queryParameters: queryParameters,
      options: effectiveOptions,
    );

    if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      return Right(response);
    } else {
      return Left('HTTP Error: ${response.statusCode} - ${response.statusMessage}');
    }
  } on DioException catch (e) {
    if (e.response != null) {
      return Left('Server Error: ${e.response!.statusCode} - ${e.response!.data}');
    } else {
      return Left('Network Error: ${e.message}');
    }
  } catch (e) {
    return Left('Unexpected Error: $e');
  }
}



  @override
  Future<Either<String, Response>> put({String? path, Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await dio.put(path!, data: data, queryParameters: queryParameters);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Response>> delete({String? path, Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await dio.delete(path!, data: data, queryParameters: queryParameters);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
