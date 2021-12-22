import 'package:benzapp_flutter/models/entity.dart';
import 'package:benzapp_flutter/repositories/model/tipo_impianto.dart';

import 'marchio.dart';

class Station extends Entity {
  String _provincia;
  String _comune;
  String _indirizzo;

  double _longitudine;

  String get provincia => _provincia;
  double _latitudine;

  Station(this._provincia, this._comune, this._indirizzo, this._longitudine,
      this._latitudine, this._tipo, this._marchio,
      {int id = 0})
      : super(id = id);

  TipoImpianto _tipo;

  Marchio _marchio;

  String get comune => _comune;

  String get indirizzo => _indirizzo;

  double get longitudine => _longitudine;

  double get latitudine => _latitudine;

  TipoImpianto get tipo => _tipo;

  Marchio get marchio => _marchio;
}
