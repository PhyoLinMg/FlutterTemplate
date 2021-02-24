import 'package:dio/dio.dart';

import '../utils/Utils.dart';

class RequestInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    Utils.getToken().then((value) {
      options.headers["Authorization"] = "$value";
    });

    return super.onRequest(options);
  }
}
