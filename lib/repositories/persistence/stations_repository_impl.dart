import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/persistence/app_database.dart';
import 'package:benzapp_flutter/repositories/stations_repository.dart';

class StationsRepositoryImpl implements StationsRepository {
  final AppDatabase _database;

  StationsRepositoryImpl(this._database);

  @override
  Future<void> update() async {}

  @override
  Future<List<Station>> getData() {
    return _database.stationDao.findAll();
  }
}
