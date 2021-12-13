import 'package:benzapp_flutter/models/entity.dart';
import 'package:benzapp_flutter/models/vehicle_type.dart';

class Vehicle extends Entity {
  final String codice;
  final VehicleType veicolo;
  final DateTime date;

  Vehicle(this.codice, this.veicolo, this.date) : super(0);
}
