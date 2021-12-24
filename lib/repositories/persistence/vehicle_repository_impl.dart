import 'package:benzapp_flutter/network/api/tessera_resource_api.dart';
import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/network/model/tessera.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/persistence/dao/vehicle_dao.dart';
import 'package:benzapp_flutter/repositories/vehicle_repository.dart';

import 'app_database.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  final ApiClient _apiClient;
  final AppDatabase _database;

  VehicleRepositoryImpl(this._database, this._apiClient);

  @override
  Future<void> update() async {
    TesseraResourceApi tesseraResourceApi = _apiClient.getTesseraResourceApi();
    final List<Tessera>? list =
        (await tesseraResourceApi.getAllTesserasUsingGET()).data?.toList();

    final VehicleDao vehicleDao = _database.vehicleDao;

    vehicleDao.deleteAll();
    for (Tessera item in list!) {
      vehicleDao.insert(Vehicle.ofTessera(item));
    }
  }
}
