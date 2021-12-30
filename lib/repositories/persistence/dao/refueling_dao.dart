import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/model/tessera_summary.dart';
import 'package:floor/floor.dart';

@dao
abstract class RefuelingDao {
  @Query("SELECT * FROM refuelings ORDER BY data desc")
  Stream<List<Refueling>> findAllLive();

  @Query("SELECT * FROM refuelings WHERE targa = :targa ORDER BY data desc")
  Stream<Refueling?> findOneByTargaLiveData(String targa);

  @Query("SELECT * FROM refuelings WHERE targa = :targa ORDER BY targa")
  Future<Refueling?> findOneByTarga(String targa);

  @Query("SELECT * FROM refuelings WHERE id = :id")
  Future<Refueling?> findAllByIdLive(int id);

  @Insert()
  Future<void> insert(Refueling value);

  @Query("DELETE FROM refuelings")
  Future<void> deleteAll();

  @Query(
      "SELECT SUM((prezzoAlLitro-sconto)*litriErogati) as spesa, SUM(litriErogati) as litriErogati, SUM(sconto*litriErogati) as risparmio FROM refuelings WHERE targa=:targa")
  Future<TesseraSummary?> sumLitriErogatiByTarga(String targa);

  @Query("SELECT * FROM refuelings WHERE targa = :targa ORDER BY targa")
  Future<List<Refueling>> findAllLiveByTarga(String targa);
}
