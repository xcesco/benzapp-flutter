import 'package:benzapp_flutter/network/model/tessera.dart';
import 'package:benzapp_flutter/repositories/model/tessera_summary.dart';

class VehicleStatus {
  final Tessera _tessera;
  final TesseraSummary _summary;

  Tessera get tessera => _tessera;

  VehicleStatus(this._tessera, this._summary);

  TesseraSummary get summary => _summary;
}
