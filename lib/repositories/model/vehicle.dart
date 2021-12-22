import 'package:benzapp_flutter/models/entity.dart';
import 'package:benzapp_flutter/network/model/cittadino.dart';
import 'package:benzapp_flutter/network/model/delega.dart';
import 'package:benzapp_flutter/network/model/rifornimento.dart';
import 'package:benzapp_flutter/network/model/tessera.dart';

class Vehicle extends Entity {
  final TesseraCarburanteEnum _carburante;

  final Cittadino _cittadino;

  final String _codice;

  final DateTime _dataEmissione;

  final List<Delega> _delegas;

  final String _immagine;

  final String _immagineContentType;

  final Set<Rifornimento> _rifornimentos;

  final String _targa;

  final TesseraVeicoloEnum _veicolo;

  final bool _delega;

  Vehicle(
      this._carburante,
      this._cittadino,
      this._codice,
      this._dataEmissione,
      this._delegas,
      this._immagine,
      this._immagineContentType,
      this._rifornimentos,
      this._targa,
      this._veicolo,
      this._delega,
      {int id = 0})
      : super(id = id);

  TesseraCarburanteEnum get carburante => _carburante;

  Cittadino get cittadino => _cittadino;

  String get codice => _codice;

  DateTime get dataEmissione => _dataEmissione;

  bool get delega => _delega;

  List<Delega> get delegas => _delegas;

  String get immagine => _immagine;

  String get immagineContentType => _immagineContentType;

  Set<Rifornimento> get rifornimentos => _rifornimentos;

  String get targa => _targa;

  TesseraVeicoloEnum get veicolo => _veicolo;

/*
  public static Vehicle of(Delega delega) {
    Tessera tessera = delega.getTessera();
    Cittadino cittadino = delega.getCittadino();
    return new Vehicle(
        tessera.getCarburante(),
        cittadino,
        tessera.getCodice(),
        tessera.getDataEmissione(),
        tessera.getDelegas(),
        tessera.getId(),
        tessera.getImmagine(),
        tessera.getImmagineContentType(),
        tessera.getRifornimentos(),
        tessera.getTarga(),
        tessera.getVeicolo(),
        true);
  }

  public static Vehicle of(Tessera tessera) {
    return new Vehicle(
        tessera.getCarburante(),
        tessera.getCittadino(),
        tessera.getCodice(),
        tessera.getDataEmissione(),
        tessera.getDelegas(),
        tessera.getId(),
        tessera.getImmagine(),
        tessera.getImmagineContentType(),
        tessera.getRifornimentos(),
        tessera.getTarga(),
        tessera.getVeicolo(),
        false);
  }*/

}
