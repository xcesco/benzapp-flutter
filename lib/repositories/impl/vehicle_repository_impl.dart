import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/model/vehicle_summary.dart';
import 'package:benzapp_flutter/repositories/network/api/delega_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/tessera_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/delega.dart';
import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:benzapp_flutter/repositories/persistence/dao/vehicle_dao.dart';
import 'package:benzapp_flutter/repositories/vehicle_repository.dart';

import '../persistence/app_database.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  final ApiClient _apiClient;
  final AppDatabase _database;

  VehicleRepositoryImpl(this._database, this._apiClient);

  @override
  Future<void> update() async {
    final TesseraResourceApi tessereResourceApi =
        _apiClient.getTesseraResourceApi();
    final DelegaResourceApi delegheResourceApi =
        _apiClient.getDelegaResourceApi();

    final VehicleDao vehicleDao = _database.vehicleDao;

    vehicleDao.deleteAll();

    List<Vehicle> list1 = [];
    final List<Tessera>? listTessere =
        (await tessereResourceApi.getAllTesserasUsingGET()).data?.toList();

    if (listTessere != null) {
      list1 = listTessere.map((e) => Vehicle.ofTessera(e)).toList();
    }

    List<Vehicle> list2 = [];
    final List<Delega>? listDeleghe =
        (await delegheResourceApi.getAllDelegasUsingGET()).data?.toList();
    if (listDeleghe != null) {
      list2 = listDeleghe.map((e) => Vehicle.ofDelega(e)).toList();
    }

    final List<Vehicle> list = list1 + list2;
    vehicleDao.insertInTransaction(list);
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
