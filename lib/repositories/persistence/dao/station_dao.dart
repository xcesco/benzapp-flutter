import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:floor/floor.dart';

@dao
abstract class StationDao {
  @Query("SELECT * FROM stations ORDER BY comune asc, indirizzo asc")
  Stream<List<Station>> findAllLive();

  @Insert()
  Future<void> insert(Station value);
}
