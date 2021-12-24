import 'package:benzapp_flutter/network/model/cittadino.dart';
import 'package:benzapp_flutter/network/model/delega.dart';
import 'package:benzapp_flutter/network/model/tessera.dart';
import 'package:benzapp_flutter/repositories/model/base_entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'vehicles')
class Vehicle extends BaseEntity {
  final TesseraCarburanteEnum carburante;

  final Cittadino cittadino;

  final String codice;

  final DateTime dataEmissione;

  // @TypeConverters([DelegaListConverter])
  // final List<Delega> delegas;

  final String immagine;

  final String immagineContentType;

  // @TypeConverters([RifornimentoSetConverter])
  // final Set<Rifornimento> rifornimentos;

  final String targa;

  final TesseraVeicoloEnum veicolo;

  final bool delega;

  Vehicle(
      this.carburante,
      this.cittadino,
      this.codice,
      this.dataEmissione,
      // this.delegas,
      this.immagine,
      this.immagineContentType,
      // this.rifornimentos,
      this.targa,
      this.veicolo,
      this.delega,
      {int? id})
      : super(id = id);

  static Vehicle ofDelega(Delega delega) {
    return Vehicle(
        delega.tessera?.carburante ?? TesseraCarburanteEnum.BENZINA,
        Cittadino(),
        delega.tessera?.codice ?? '',
        DateTime.now(),
        // delega.tessera?.delegas?.toList() ?? [],
        delega.tessera?.immagine ?? '',
        delega.tessera?.immagineContentType ?? '',
        // delega.tessera?.rifornimentos?.asSet() ?? {},
        delega.tessera?.targa ?? '',
        delega.tessera?.veicolo ?? TesseraVeicoloEnum.AUTOVEICOLO,
        true);
  }

  static Vehicle ofTessera(Tessera tessera) {
    return Vehicle(
        tessera.carburante ?? TesseraCarburanteEnum.BENZINA,
        Cittadino(),
        tessera.codice ?? '',
        DateTime.now(),
        // tessera.delegas?.toList() ?? [],
        tessera.immagine ?? '',
        tessera.immagineContentType ?? '',
        // tessera.rifornimentos?.asSet() ?? {},
        tessera.targa ?? '',
        tessera.veicolo ?? TesseraVeicoloEnum.AUTOVEICOLO,
        false);
  }
}
