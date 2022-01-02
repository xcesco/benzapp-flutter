import 'package:benzapp_flutter/repositories/network/model/gestore.dart';
import 'package:benzapp_flutter/repositories/network/model/rifornimento.dart';
import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:floor/floor.dart';

import 'base_entity.dart';

@Entity(tableName: 'refuelings')
class Refueling extends BaseEntity {
  Refueling(
      this.data,
      this.gestore,
      this.litriErogati,
      this.prezzoAlLitro,
      this.sconto,
      this.tessera,
      this.tipoCarburante,
      this.targa,
      this.gestoreId,
      {int? id})
      : super(id = id);

  final DateTime data;
  final Gestore gestore;
  final double litriErogati;
  final double prezzoAlLitro;
  final double sconto;
  final Tessera tessera;
  final RifornimentoTipoCarburanteEnum tipoCarburante;
  final String targa;
  final int gestoreId;

  static Refueling of(Rifornimento value) {
    return Refueling(
        value.data ?? DateTime.now(),
        value.gestore ?? Gestore(),
        value.litriErogati ?? 0,
        value.prezzoAlLitro ?? 0,
        value.sconto ?? 0,
        value.tessera ?? Tessera(),
        value.tipoCarburante ?? RifornimentoTipoCarburanteEnum.BENZINA,
        value.tessera?.targa ?? '',
        value.gestore?.id ?? 0);
  }
}
