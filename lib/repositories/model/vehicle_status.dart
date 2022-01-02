import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/model/vehicle_summary.dart';

class VehicleStatus {
  final Vehicle _vehicle;
  final VehicleSummary _summary;

  Vehicle get tessera => _vehicle;

  VehicleStatus(this._vehicle, this._summary);

  VehicleSummary get summary => _summary;
}
