abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers,

  });
  Future<dynamic> post(
    
    String path, {

    dynamic data,
    Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,

    bool isFormData = false,
  });
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
