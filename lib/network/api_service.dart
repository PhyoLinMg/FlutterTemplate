import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:template/network/request_interceptor.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(RequestInterceptor());
    dio.options.headers["Content-Type"] = "application/json";
    return ApiService(dio);
  }
}
