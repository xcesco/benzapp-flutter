import 'package:benzapp_flutter/repositories/network/api/delega_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/tessera_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/delega.dart';
import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/model/vehicle_summary.dart';
import 'package:benzapp_flutter/repositories/persistence/dao/vehicle_dao.dart';
import 'package:benzapp_flutter/repositories/vehicle_repository.dart';
import 'package:floor/floor.dart';

import '../persistence/app_database.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  final ApiClient _apiClient;
  final AppDatabase _database;

  VehicleRepositoryImpl(this._database, this._apiClient);

  @transaction
  @override
  Future<void> update() async {
    final TesseraResourceApi tessereResourceApi =
        _apiClient.getTesseraResourceApi();
    final DelegaResourceApi delegheResourceApi =
        _apiClient.getDelegaResourceApi();

    final VehicleDao vehicleDao = _database.vehicleDao;
    vehicleDao.deleteAll();

    await _loadTessere(tessereResourceApi, vehicleDao);
    await _loadDeleghe(delegheResourceApi, vehicleDao);
  }

  @transaction
  Future<void> _loadTessere(
      TesseraResourceApi tesseraResourceApi, VehicleDao vehicleDao) async {
    final List<Tessera>? list =
        (await tesseraResourceApi.getAllTesserasUsingGET()).data?.toList();
    for (final Tessera item in list!) {
      vehicleDao.insert(Vehicle.ofTessera(item));
    }
  }

  @transaction
  Future<void> _loadDeleghe(
      DelegaResourceApi tesseraResourceApi, VehicleDao vehicleDao) async {
    final List<Delega>? list =
        (await tesseraResourceApi.getAllDelegasUsingGET()).data?.toList();
    for (final Delega item in list!) {
      vehicleDao.insert(Vehicle.ofDelega(item));
    }
  }

  @override
  Future<List<Vehicle>> getData() => _database.vehicleDao.findAll();

  @override
  Future<Vehicle?> findByTarga(String targa) =>
      _database.vehicleDao.findOneByTarga(targa);

  @override
  Future<VehicleSummary?> findSummaryByTarga(String targa) =>
      _database.vehicleDao.sumLitriErogatiByTarga(targa);
}
