import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/account_repository.dart';
import 'package:benzapp_flutter/repositories/persistence/app_preferences.dart';
import 'package:benzapp_flutter/repositories/refueling_repository.dart';
import 'package:benzapp_flutter/repositories/vehicle_repository.dart';
import 'package:tuple/tuple.dart';

import '../../viewmodels/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  bool _isLoading = false;
  LoginStatus _loginStatus = LoginStatus.unknown;

  final AccountRepository _accountRepository;
  final VehicleRepository _vehicleRepository;
  final RefuelingRepository _refuelingRepository;

  LoginViewModel(this._accountRepository, this._vehicleRepository, this._refuelingRepository);

  bool get isLoading {
    return _isLoading;
  }

  LoginStatus get loginStatus {
    return _loginStatus;
  }

  String get backendBaseUrl => _accountRepository.backendBaseUrl;

  Future<void> refreshRemoteConfig({bool updateUI = false}) async {
    if (updateUI) {
      _isLoading = true;
      notifyListeners();
    }

    await _accountRepository.refreshRemoteConfig();

    if (updateUI) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> isPrimoAccesso() => AppPreferences.instance.isPrimoAccesso();

  Future<LoginStatus> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    final Tuple2<AdminUserDTO?, LoginStatus> loginResult = await _accountRepository.login(username, password);
    if (loginResult.item2 == LoginStatus.success) {
      _vehicleRepository.update();
      _refuelingRepository.update();
    }

    _loginStatus = loginResult.item2;
    _isLoading = false;
    notifyListeners();
    return _loginStatus;
  }
}
