import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/account_repository.dart';
import 'package:benzapp_flutter/repositories/impl/vehicle_repository_impl.dart';
import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/notification_repository.dart';
import 'package:benzapp_flutter/repositories/persistence/app_preferences.dart';
import 'package:benzapp_flutter/repositories/refueling_repository.dart';
import 'package:benzapp_flutter/viewmodels/base_view_model.dart';
import 'package:floor/floor.dart';
import 'package:tuple/tuple.dart';

class HomeViewModel extends BaseViewModel {
  bool _isLoading = false;
  LoginStatus _loginStatus = LoginStatus.unknown;
  final VehicleRepositoryImpl _vehicleRepository;
  final RefuelingRepository _refuelingRepository;
  final NotificationRepository _notificationRepository;
  final AccountRepository _accountRepository;

  HomeViewModel(this._vehicleRepository, this._refuelingRepository,
      this._notificationRepository, this._accountRepository);

  Future<bool> isPrimoAccesso() => AppPreferences.instance.isPrimoAccesso();

  Future<List<Vehicle>> getTessere() {
    return _vehicleRepository.getData();
  }

  Future<List<Refueling>> getRifornimenti() {
    return _refuelingRepository.getData();
  }

  @transaction
  Future<void> logout() {
    return _accountRepository.logout();
  }

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

  Future<LoginStatus> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    final Tuple2<AdminUserDTO?, LoginStatus> loginResult =
        await _accountRepository.login(username, password);
    if (loginResult.item2 == LoginStatus.success) {
      await updateData();
    }

    _loginStatus = loginResult.item2;

    return _loginStatus;
  }

  @transaction
  Future<void> updateData() async {
    _isLoading = true;
    AppDebug.log(">>>>>>>>>>>>> BEGIN");
    notifyListeners();

    await _vehicleRepository.update();
    await _refuelingRepository.update();

    _isLoading = false;
    notifyListeners();
    AppDebug.log(">>>>>>>>>>>>> END");
  }
}
