import 'package:benzapp_flutter/repositories/base_repository.dart';

import 'model/station.dart';

abstract class StationsRepository extends BaseRepository {
  Future<List<Station>> loadStations();
}
