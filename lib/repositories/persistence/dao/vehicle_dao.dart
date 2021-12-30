import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:floor/floor.dart';

@dao
abstract class VehicleDao {
  @Query("SELECT * FROM vehicles ORDER BY targa")
  Stream<List<Vehicle>> findAllLive();

  @Query("SELECT * FROM vehicles ORDER BY targa")
  Future<List<Vehicle>> findAll();

  @Query("SELECT * FROM vehicles WHERE targa = :targa ORDER BY targa")
  Stream<Vehicle?> findOneByTargaLiveData(String targa);

  @Query("SELECT * FROM vehicles WHERE targa = :targa ORDER BY targa")
  Future<Vehicle?> findOneByTarga(String targa);

  @Insert()
  Future<void> insert(Vehicle value);

  @Query("DELETE FROM vehicles")
  Future<void> deleteAll();
}
