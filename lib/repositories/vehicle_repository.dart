import 'package:benzapp_flutter/repositories/model/vehicle_summary.dart';

import 'abstract_repository.dart';
import 'model/vehicle.dart';

abstract class VehicleRepository extends AbstractRepository<Vehicle> {
  Future<Vehicle?> findByTarga(String targa);

  Future<VehicleSummary?> findSummaryByTarga(String targa);
}
