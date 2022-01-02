import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:floor/floor.dart';

@dao
abstract class RefuelingDao {
  @Query("SELECT * FROM refuelings ORDER BY data desc")
  Future<List<Refueling>> findAll();

  @Query("SELECT * FROM refuelings WHERE targa = :targa ORDER BY data desc")
  Stream<Refueling?> findOneByTargaLiveData(String targa);

  @Query("SELECT * FROM refuelings WHERE targa = :targa ORDER BY data desc")
  Future<Refueling?> findOneByTarga(String targa);

  @Query("SELECT * FROM refuelings WHERE id = :id")
  Future<Refueling?> findAllByIdLive(int id);

  @Insert()
  Future<void> insert(Refueling value);

  @Query("DELETE FROM refuelings")
  Future<void> deleteAll();

  @Query("SELECT * FROM refuelings WHERE targa = :targa ORDER BY data desc")
  Future<List<Refueling>> findAllLiveByTarga(String targa);
}
