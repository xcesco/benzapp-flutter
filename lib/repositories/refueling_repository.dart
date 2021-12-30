import 'package:benzapp_flutter/repositories/persistence/abstract_repository.dart';

import 'model/refueling.dart';

abstract class RefuelingRepository extends AbstractRepository<Refueling> {
  Future<List<Refueling>> getDataByTarga(String targa);

  Future<Refueling?> getDataById(int id);
}
