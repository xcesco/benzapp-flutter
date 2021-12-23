import 'package:benzapp_flutter/network/api/account_resource_api.dart';

import 'api.dart';
import 'api/user_jwt_controller_api.dart';

class ApiClient {
  Openapi _openapi = Openapi();

  ApiClient();

  void updateBaseUrl(String backendBaseUrl) {
    _openapi = Openapi(basePathOverride: backendBaseUrl);
  }

  UserJwtControllerApi getUserJwtControllerApi() {
    return _openapi.getUserJwtControllerApi();
  }

  AccountResourceApi getAccountResourceApi() {
    return _openapi.getAccountResourceApi();
  }

  void setJWTToken(String token) {
    _openapi.setJWTToken("benzapp", token);
  }
}

enum LoginStatus { success, invalidCredential, error, unknown }