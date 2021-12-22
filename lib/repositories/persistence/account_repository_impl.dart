import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/network/model/jwt_token.dart';
import 'package:benzapp_flutter/network/model/login_vm.dart';
import 'package:benzapp_flutter/serializers.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import '../account_repository.dart';

class AccountRepositoryImpl extends AccountRepository {
  static const backendBaseUrlParameter = 'backend_base_url';
  final ApiClient _apiClient;

  AccountRepositoryImpl(this._apiClient);

  @override
  Future<AdminUserDTO?> getAccount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? serializedValue = sharedPreferences.getString("AdminUserDTO");
    final value = serializedValue != null
        ? standardSerializers.deserializeWith(
            AdminUserDTO.serializer, serializedValue)
        : null;

    return value;
  }

  @override
  Future<JWTToken?> getJWTToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? serializedValue = sharedPreferences.getString("JWTToken");
    final value = serializedValue != null
        ? standardSerializers.deserializeWith(
            JWTToken.serializer, serializedValue)
        : null;

    return value;
  }

  @override
  bool hasValidAccount() {
    // TODO: implement hasValidAccount
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<AdminUserDTO?, LoginStatus>> login(
      String username, String password) async {
    var remoteConfig = await RemoteConfig.instance;
    var backendBaseUrl =
        remoteConfig.getString(backendBaseUrlParameter).toString();
    _apiClient.updateBaseUrl(backendBaseUrl);

    var loginBuilder = LoginVMBuilder();
    loginBuilder.username = username;
    loginBuilder.password = password;

    try {
      Response<JWTToken> response = await _apiClient
          .getUserJwtControllerApi()
          .authorizeUsingPOST(loginVM: loginBuilder.build());

      String token = updateClientJWTToken(response.data!);

      _apiClient.getUserJwtControllerApi();
      var accountResourceApi = _apiClient.getAccountResourceApi();
      var account = (await accountResourceApi.getAccountUsingGET()).data;

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("AdminUserDTO",
          standardSerializers.toJson(AdminUserDTO.serializer, account));
      sharedPreferences.setString("JWTToken", token);

      return Tuple2<AdminUserDTO?, LoginStatus>(account, LoginStatus.success);
    } on DioError catch (error, _) {
      return (error.response?.statusCode == 401)
          ? const Tuple2<AdminUserDTO?, LoginStatus>(
              null, LoginStatus.invalidCredential)
          : const Tuple2<AdminUserDTO?, LoginStatus>(null, LoginStatus.error);
    }
  }

  @override
  bool logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  String updateClientJWTToken(JWTToken jwtToken) {
    String token = jwtToken.idToken ?? '<NO-TOKEN>';
    _apiClient.setApiKey("api_key", token);
    return token;
  }
}
