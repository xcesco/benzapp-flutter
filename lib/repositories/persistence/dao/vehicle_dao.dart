import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/model/vehicle_summary.dart';
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

  @Query(
      "SELECT targa, spesa, litriErogati, risparmio FROM vehicle_summaries WHERE targa=:targa")
  Future<VehicleSummary?> sumLitriErogatiByTarga(String targa);

  @Insert()
  Future<void> insert(Vehicle value);

  @Insert()
  Future<void> insertList(List<Vehicle> values);

  @Query("DELETE FROM vehicles")
  Future<void> deleteAll();

  @transaction
  Future<void> insertInTransaction(List<Vehicle> values) async {
    await deleteAll();
    await insertList(values);
  }
}
