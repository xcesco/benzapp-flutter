import 'package:dio/dio.dart';

import 'auth.dart';

class HttpAuthInterceptor extends AuthInterceptor {
  Map<String, String> tokens = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authInfo = getAuthInfo(options, "http");
    for (var info in authInfo) {
      final token = tokens[info["name"]];
      if (token != null) {
        options.headers["authorization"] = "Bearer ${token}";
        break;
      }
    }
    super.onRequest(options, handler);
  }
}
