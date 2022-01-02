import 'package:benzapp_flutter/repositories/network/api/device_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/network/model/device.dart';
import 'package:benzapp_flutter/repositories/application_info_repository.dart';
import 'package:benzapp_flutter/repositories/persistence/app_preferences.dart';
import 'package:benzapp_flutter/repositories/persistence/secure_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../app_debug.dart';
import '../../viewmodels/base_view_model.dart';

class LockViewModel extends BaseViewModel {
  final ApplicationInfoRepository _applicationInfoRepository;
  final SecureRepository _secureRepository;
  final ApiClient _apiClient;

  LockViewModel(
      this._applicationInfoRepository, this._secureRepository, this._apiClient);

  String get appName => _applicationInfoRepository.appName;

  String get buildNumber => _applicationInfoRepository.buildNumber;

  String get packageName => _applicationInfoRepository.packageName;

  String get version => _applicationInfoRepository.version;

  bool validPIN = false;

  Future<String?> getCurrentPIN() {
    return _secureRepository.readPin();
  }

  Future<void> unlock(String pin) async {
    final DeviceResourceApi deviceResourceApi =
        _apiClient.getDeviceResourceApi();

    final AdminUserDTO? account = await AppPreferences.instance.getAccount();
    final DeviceBuilder deviceBuilder = DeviceBuilder();
    deviceBuilder.owner = account?.login ?? '<UNKNOWN>';
    deviceBuilder.deviceId = await FirebaseMessaging.instance.getToken();

    AppDebug.log(
        'register FMC device , owner: ${deviceBuilder.owner}, deviceId: ${deviceBuilder.deviceId}');

    deviceResourceApi.createDeviceUsingPOST(device: deviceBuilder.build());
  }

  Future<void> savePIN(String value) {
    AppPreferences.instance.setPrimoAccesso(false);
    return _secureRepository.writePin(value);
  }

  Future<bool> isPrimoAccesso() => AppPreferences.instance.isPrimoAccesso();
}
