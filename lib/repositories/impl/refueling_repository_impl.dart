import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/network/api/rifornimento_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/rifornimento.dart';
import 'package:benzapp_flutter/repositories/persistence/app_database.dart';
import 'package:benzapp_flutter/repositories/persistence/dao/refueling_dao.dart';
import 'package:benzapp_flutter/repositories/refueling_repository.dart';

class RefuelingRepositoryImpl extends RefuelingRepository {
  final ApiClient _apiClient;
  final AppDatabase _database;

  RefuelingRepositoryImpl(this._database, this._apiClient);

  @override
  Future<void> update() async {
    final RefuelingDao daoRifornimenti = _database.refuelingDao;
    final RifornimentoResourceApi rifornimenotResourceApi =
    _apiClient.getRifornimentoResourceApi();

    final List<Rifornimento>? list =
    (await rifornimenotResourceApi.getAllRifornimentosUsingGET(size: 1000))
        .data
        ?.toList();

    if (list != null) {
      daoRifornimenti
          .insertInTransaction(list.map((e) => Refueling.of(e)).toList());
    }
  }

  @override
  Future<Refueling?> getDataById(int id) async =>
      _database.refuelingDao.findAllByIdLive(id);

  @override
  Future<List<Refueling>> getData() async => _database.refuelingDao.findAll();

  @override
  Future<List<Refueling>> getDataByTarga(String targa) =>
      _database.refuelingDao.findAllLiveByTarga(targa);
}
