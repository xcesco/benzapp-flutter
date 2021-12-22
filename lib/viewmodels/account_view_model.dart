import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/repositories/account_repository.dart';
import 'package:benzapp_flutter/repositories/persistence/account_repository_impl.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class AccountViewModel with ChangeNotifier {
  bool _isLoading = false;
  LoginStatus _loginStatus = LoginStatus.unknown;
  late RemoteConfig _remoteConfig;

  final _maintenanceModeParameter = 'maintenance_mode';

  final AccountRepository _accountRepository;

  AccountViewModel(this._accountRepository);

  String backendBaseUrl = 'localhost:8080';

  Future<void> initRemoteConfig() async {
    _isLoading = true;
    notifyListeners();
    _remoteConfig = await RemoteConfig.instance;

    final Map<String, dynamic> defaults = <String, dynamic>{
      AccountRepositoryImpl.backendBaseUrlParameter: 'http://10.0.0.2:8080',
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

  LoginStatus get loginStatus {
    return _loginStatus;
  }

  Future<LoginStatus> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();
    var loginResult = await _accountRepository.login(username, password);

    _loginStatus = loginResult.item2;
    _isLoading = false;
    notifyListeners();
    return _loginStatus;
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      await _remoteConfig.fetch();
      await _remoteConfig.activate();

      print('Last fetch status: ' + _remoteConfig.lastFetchStatus.toString());
      print('Last fetch time: ' + _remoteConfig.lastFetchTime.toString());

      backendBaseUrl = _remoteConfig
          .getString(AccountRepositoryImpl.backendBaseUrlParameter)
          .toString();

      print('backendBaseUrl: ${backendBaseUrl}');

      notifyListeners();
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}
