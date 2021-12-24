import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/account_repository.dart';
import 'package:benzapp_flutter/repositories/persistence/account_repository_impl.dart';
import 'package:benzapp_flutter/repositories/vehicle_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class LoginViewModel with ChangeNotifier {
  bool _isLoading = false;
  LoginStatus _loginStatus = LoginStatus.unknown;
  late RemoteConfig _remoteConfig;

  final String _maintenanceModeParameter = 'maintenance_mode';

  final AccountRepository _accountRepository;
  final VehicleRepository _vehicleRepository;

  String backendBaseUrl = 'localhost:8080';

  LoginViewModel(this._accountRepository, this._vehicleRepository);

  bool get isLoading {
    return _isLoading;
  }

  LoginStatus get loginStatus {
    return _loginStatus;
  }

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

  Future<LoginStatus> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    final Tuple2<AdminUserDTO?, LoginStatus> loginResult =
        await _accountRepository.login(username, password);
    if (loginResult.item2 == LoginStatus.success) {
      _vehicleRepository.update();
    }

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
