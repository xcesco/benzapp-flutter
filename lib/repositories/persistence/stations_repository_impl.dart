import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/persistence/app_database.dart';
import 'package:benzapp_flutter/repositories/stations_repository.dart';

import 'dao/station_dao.dart';

class StationsRepositoryImpl implements StationsRepository {
  final AppDatabase _database;

  StationsRepositoryImpl(this._database);

  @override
  void update() {}

  @override
  Future<List<Station>> loadStations() {
    final StationDao daoStations = _database.stationDao;

    return daoStations.findAll();
  }
}
