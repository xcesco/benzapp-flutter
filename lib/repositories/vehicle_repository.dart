import 'abstract_repository.dart';
import 'model/vehicle.dart';

abstract class VehicleRepository extends AbstractRepository<Vehicle> {
  Future<Vehicle?> findByTarga(String targa);
}
