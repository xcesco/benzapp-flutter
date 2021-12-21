import 'package:benzapp_flutter/api.dart';
import 'package:benzapp_flutter/model/login_vm.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class AccountModel with ChangeNotifier {
  bool _isLoading = false;
  late RemoteConfig _remoteConfig;
  final _backendBaseUrlParameter = 'backend_base_url';
  final _maintenanceModeParameter = 'maintenance_mode';
  late Openapi api;

  String backendBaseUrl = 'localhost:8080';

  Future<void> initRemoteConfig() async {
    _isLoading = true;
    notifyListeners();
    _remoteConfig = await RemoteConfig.instance;

    final Map<String, dynamic> defaults = <String, dynamic>{
      _backendBaseUrlParameter: 'http://10.0.0.2:8080',
      _maintenanceModeParameter: '8'
    };
    await _remoteConfig.setDefaults(defaults);

    _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));

    await _fetchRemoteConfig();
    _isLoading = false;
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<void> login(String username, String password) async {
    api = Openapi(basePathOverride: backendBaseUrl);
    var builder = LoginVMBuilder();
    builder.username = username;
    builder.password = password;

    api
        .getUserJwtControllerApi()
        .authorizeUsingPOST(loginVM: builder.build())
        .then((value) => print(value.data));
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      await _remoteConfig.fetch();
      await _remoteConfig.activate();

      print('Last fetch status: ' + _remoteConfig.lastFetchStatus.toString());
      print('Last fetch time: ' + _remoteConfig.lastFetchTime.toString());

      backendBaseUrl =
          _remoteConfig.getString(_backendBaseUrlParameter).toString();

      print('backendBaseUrl: ${backendBaseUrl}');

      notifyListeners();
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}
