import 'package:benzapp_flutter/network/model/gestore.dart';
import 'package:benzapp_flutter/network/model/rifornimento.dart';
import 'package:benzapp_flutter/network/model/tessera.dart';

import 'entity.dart';

class Refueling extends Entity {
  final DateTime _data;
  final Gestore _gestore;

  final double _litriErogati;
  final double _prezzoAlLitro;
  final double _sconto;
  final Tessera _tessera;
  final RifornimentoTipoCarburanteEnum _tipoCarburante;
  final String _targa;
  final int _gestoreId;

  Refueling(
      this._data,
      this._gestore,
      this._litriErogati,
      this._prezzoAlLitro,
      this._sconto,
      this._tessera,
      this._tipoCarburante,
      this._targa,
      this._gestoreId,
      {int id = 0})
      : super(id = id);

  DateTime get data => _data;

  /*static Refueling of(Rifornimento value) {
    return Refueling(
        value.id,
        value.data,
        value.gestore,
        value.litriErogati,
        value.prezzoAlLitro,
        value.sconto,
        value.tessera,
        value.tipoCarburante,
        value.tessera.targa,
        value.gestore.id);
  }*/

  Gestore get gestore => _gestore;

  int get gestoreId => _gestoreId;

  double get litriErogati => _litriErogati;

  double get prezzoAlLitro => _prezzoAlLitro;

  double get sconto => _sconto;

  String get targa => _targa;

  Tessera get tessera => _tessera;

  RifornimentoTipoCarburanteEnum get tipoCarburante => _tipoCarburante;
}
