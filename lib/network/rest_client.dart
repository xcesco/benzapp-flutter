import 'package:benzapp_flutter/network/model/jwt_token.dart';
import 'package:dio/dio.dart';

import 'api.dart';
import 'model/login_vm.dart';

class RestClient {
  Openapi _openapi = Openapi();

  RestClient();

  void updateBaseUrl(String backendBaseUrl) {
    _openapi = Openapi(basePathOverride: backendBaseUrl);
  }

  Future<LoginStatus> login(String username, String password) async {
    var loginBuilder = LoginVMBuilder();
    loginBuilder.username = username;
    loginBuilder.password = password;

    try {
      Response<JWTToken> response = await _openapi
          .getUserJwtControllerApi()
          .authorizeUsingPOST(loginVM: loginBuilder.build());

      _openapi.setOAuthToken("benzapp", response.data?.idToken ?? "<NO-TOKEN>");
      return LoginStatus.success;
    } on DioError catch (error, e) {
      return (error.response?.statusCode == 401)
          ? LoginStatus.invalidCredential
          : LoginStatus.error;
    }
  }
}

enum LoginStatus { success, invalidCredential, error, unknown }
