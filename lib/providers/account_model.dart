import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class AccountModel with ChangeNotifier {
  bool _isLoading = false;
  late RemoteConfig _remoteConfig;
  final _backendBaseUrlParameter = 'backend_base_url';
  final _maintenanceModeParameter = 'maintenance_mode';

  String backendBaseUrl = 'localhost:8080';

  void initRemoteConfig() async {
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
