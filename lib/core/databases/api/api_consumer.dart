import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ApiConsumer {
 Future<Either<String, Response>> get({
    String? path,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<String, Response>> post({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Map<String, String>? headers,
  });


  Future<Either<String, Response>> put({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<Either<String, Response>> delete({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}