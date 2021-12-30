import 'package:benzapp_flutter/network/api/rifornimento_resource_api.dart';
import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/network/model/rifornimento.dart';
import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/persistence/dao/refueling_dao.dart';
import 'package:benzapp_flutter/repositories/refueling_repository.dart';
import 'package:floor/floor.dart';

import 'app_database.dart';

class RefuelingRepositoryImpl extends RefuelingRepository {
  final ApiClient _apiClient;
  final AppDatabase _database;

  RefuelingRepositoryImpl(this._database, this._apiClient);

  @transaction
  @override
  Future<void> update() async {
    final RefuelingDao daoRifornimenti = _database.refuelingDao;
    final RifornimentoResourceApi rifornimenotResourceApi = _apiClient.getRifornimentoResourceApi();

    await daoRifornimenti.deleteAll();
    final List<Rifornimento>? list = (await rifornimenotResourceApi.getAllRifornimentosUsingGET()).data?.toList();

    if (list != null) {
      for (final Rifornimento item in list) {
        daoRifornimenti.insert(Refueling.of(item));
      }
    }
  }

  @override
  Future<Refueling?> getDataById(int id) async => _database.refuelingDao.findAllByIdLive(id);

  @override
  Future<List<Refueling>> getData() async => _database.refuelingDao.findAll();

  @override
  Future<List<Refueling>> getDataByTarga(String targa) => _database.refuelingDao.findAllLiveByTarga(targa);
}
