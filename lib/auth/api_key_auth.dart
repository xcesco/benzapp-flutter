import 'package:dio/dio.dart';

import 'auth.dart';

class ApiKeyAuthInterceptor extends AuthInterceptor {
  Map<String, String> apiKeys = {};

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final authInfo = getAuthInfo(options, "apiKey");
    for (var info in authInfo) {
      final authName = info["name"];
      final authKeyName = info["keyName"];
      final authWhere = info["where"];
      final apiKey = apiKeys[authName];
      if (apiKey != null) {
        if (authWhere == 'query') {
          options.queryParameters[authKeyName] = apiKey;
        } else {
          options.headers[authKeyName] = apiKey;
        }
        break;
      }
    }
    super.onRequest(options, handler);
  }
}
