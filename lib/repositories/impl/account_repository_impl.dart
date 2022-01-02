import 'package:benzapp_flutter/repositories/network/api/account_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/network/model/jwt_token.dart';
import 'package:benzapp_flutter/repositories/network/model/login_vm.dart';
import 'package:benzapp_flutter/repositories/persistence/app_preferences.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:floor/floor.dart';
import 'package:tuple/tuple.dart';

import '../../app_debug.dart';
import '../account_repository.dart';
import '../persistence/app_database.dart';

class AccountRepositoryImpl extends AccountRepository {
  static const _backendBaseUrlParameter = 'backend_base_url';
  static const _maintenanceModeParameter = 'maintenance_mode';
  static const String defaultBackendBaseUrl = 'https://benz-app.herokuapp.com/';
  String _backendBaseUrl = defaultBackendBaseUrl;
  final ApiClient _apiClient;
  final AppDatabase _database;

  AccountRepositoryImpl(this._database, this._apiClient);

  @override
  String get backendBaseUrl => _backendBaseUrl;

  @override
  Future<AdminUserDTO?> getAccount() async {
    final AdminUserDTO? value = await AppPreferences.instance.getAccount();

    return value;
  }

  @override
  Future<String?> getJWTToken() async {
    final String? value = await AppPreferences.instance.getJWToken();

    return value;
  }

  @override
  Future<bool> hasValidAccount() async {
    final AdminUserDTO? account = await (AppPreferences.instance).getAccount();
    return account != null;
  }

  @override
  Future<String> refreshRemoteConfig() async {
    final RemoteConfig remoteConfig = RemoteConfig.instance;

    final Map<String, dynamic> defaults = <String, dynamic>{
      _backendBaseUrlParameter: 'http://10.0.0.2:8080',
      _maintenanceModeParameter: '8'
    };
    await remoteConfig.setDefaults(defaults);

    remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));

    try {
      await remoteConfig.fetch();
      await remoteConfig.activate();

      AppDebug.log(
          'Last fetch status: ' + remoteConfig.lastFetchStatus.toString());
      AppDebug.log('Last fetch time: ' + remoteConfig.lastFetchTime.toString());

      _backendBaseUrl =
          remoteConfig.getString(_backendBaseUrlParameter).toString();
      updateBaseUrl(_backendBaseUrl);

      AppDebug.log('backendBaseUrl: $backendBaseUrl');
      return _backendBaseUrl;
    } catch (e) {
      AppDebug.log('Error: ${e.toString()}');
      return defaultBackendBaseUrl;
    }
  }

  @override
  Future<Tuple2<AdminUserDTO?, LoginStatus>> login(
      String username, String password) async {
    final LoginVMBuilder loginBuilder = LoginVMBuilder();
    loginBuilder.username = username;
    loginBuilder.password = password;

    try {
      final Response<JWTToken> response = await _apiClient
          .getUserJwtControllerApi()
          .authorizeUsingPOST(loginVM: loginBuilder.build());

      final String token = updateClientJWTToken(response.data!);

      _apiClient.getUserJwtControllerApi();
      final AccountResourceApi accountResourceApi =
          _apiClient.getAccountResourceApi();
      final AdminUserDTO? account =
          (await accountResourceApi.getAccountUsingGET()).data;

      AppPreferences.instance.setAccount(account!);
      AppPreferences.instance.setJWToken(token);

      return Tuple2<AdminUserDTO?, LoginStatus>(account, LoginStatus.success);
    } on DioError catch (error, _) {
      return (error.response?.statusCode == 401)
          ? const Tuple2<AdminUserDTO?, LoginStatus>(
              null, LoginStatus.invalidCredential)
          : const Tuple2<AdminUserDTO?, LoginStatus>(null, LoginStatus.error);
    }
  }

  @transaction
  @override
  Future<void> logout() async {
    await AppPreferences.instance.removeAccount();
    await _database.refuelingDao.deleteAll();
    await _database.vehicleDao.deleteAll();
    await _database.notificationDao.deleteAll();
  }

  @override
  String updateClientJWTToken(JWTToken jwtToken) {
    final String token = jwtToken.idToken ?? '<NO-TOKEN>';
    _apiClient.setJWTToken(token);
    return token;
  }

  @override
  void updateBaseUrl(String baseUrl) {
    _apiClient.updateBaseUrl(backendBaseUrl);
  }
}
