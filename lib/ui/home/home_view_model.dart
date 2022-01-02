import 'package:benzapp_flutter/repositories/account_repository.dart';
import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/notification_repository.dart';
import 'package:benzapp_flutter/repositories/impl/vehicle_repository_impl.dart';
import 'package:benzapp_flutter/repositories/refueling_repository.dart';
import 'package:benzapp_flutter/viewmodels/base_view_model.dart';
import 'package:floor/floor.dart';

class HomeViewModel extends BaseViewModel {
  final VehicleRepositoryImpl _vehicleRepository;
  final RefuelingRepository _refuelingRepository;
  final NotificationRepository _notificationRepository;
  final AccountRepository _accountRepository;

  HomeViewModel(this._vehicleRepository, this._refuelingRepository,
      this._notificationRepository, this._accountRepository);

  Future<void> updateTessere() {
    return _vehicleRepository.update();
  }

  Future<void> updateRifornimenti() {
    return _refuelingRepository.update();
  }

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

}
