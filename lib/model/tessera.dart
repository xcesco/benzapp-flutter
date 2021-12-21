import 'package:benzapp_flutter/model/cittadino.dart';
import 'package:benzapp_flutter/model/delega.dart';
import 'package:benzapp_flutter/model/rifornimento.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tessera.g.dart';

abstract class Tessera implements Built<Tessera, TesseraBuilder> {
  @BuiltValueField(wireName: r'carburante')
  TesseraCarburanteEnum? get carburante;

  // enum carburanteEnum {  BENZINA,  DIESEL,  };

  @BuiltValueField(wireName: r'cittadino')
  Cittadino? get cittadino;

  @BuiltValueField(wireName: r'codice')
  String? get codice;

  @BuiltValueField(wireName: r'dataEmissione')
  DateTime? get dataEmissione;

  @BuiltValueField(wireName: r'delegas')
  BuiltSet<Delega>? get delegas;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'immagine')
  String? get immagine;

  @BuiltValueField(wireName: r'immagineContentType')
  String? get immagineContentType;

  @BuiltValueField(wireName: r'rifornimentos')
  BuiltSet<Rifornimento>? get rifornimentos;

  @BuiltValueField(wireName: r'targa')
  String? get targa;

  @BuiltValueField(wireName: r'veicolo')
  TesseraVeicoloEnum? get veicolo;

  // enum veicoloEnum {  AUTOVEICOLO,  CICLOMOTORE,  MOTOVEICOLO,  };

  // Boilerplate code needed to wire-up generated code
  Tessera._();

  static void _initializeBuilder(TesseraBuilder b) => b;

  factory Tessera([updates(TesseraBuilder b)]) = _$Tessera;

  static Serializer<Tessera> get serializer => _$tesseraSerializer;
}

class TesseraCarburanteEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'BENZINA')
  static const TesseraCarburanteEnum BENZINA = _$tesseraCarburanteEnum_BENZINA;
  @BuiltValueEnumConst(wireName: r'DIESEL')
  static const TesseraCarburanteEnum DIESEL = _$tesseraCarburanteEnum_DIESEL;

  static Serializer<TesseraCarburanteEnum> get serializer =>
      _$tesseraCarburanteEnumSerializer;

  const TesseraCarburanteEnum._(String name) : super(name);

  static BuiltSet<TesseraCarburanteEnum> get values =>
      _$tesseraCarburanteEnumValues;

  static TesseraCarburanteEnum valueOf(String name) =>
      _$tesseraCarburanteEnumValueOf(name);
}

class TesseraVeicoloEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'AUTOVEICOLO')
  static const TesseraVeicoloEnum AUTOVEICOLO =
      _$tesseraVeicoloEnum_AUTOVEICOLO;
  @BuiltValueEnumConst(wireName: r'CICLOMOTORE')
  static const TesseraVeicoloEnum CICLOMOTORE =
      _$tesseraVeicoloEnum_CICLOMOTORE;
  @BuiltValueEnumConst(wireName: r'MOTOVEICOLO')
  static const TesseraVeicoloEnum MOTOVEICOLO =
      _$tesseraVeicoloEnum_MOTOVEICOLO;

  static Serializer<TesseraVeicoloEnum> get serializer =>
      _$tesseraVeicoloEnumSerializer;

  const TesseraVeicoloEnum._(String name) : super(name);

  static BuiltSet<TesseraVeicoloEnum> get values => _$tesseraVeicoloEnumValues;

  static TesseraVeicoloEnum valueOf(String name) =>
      _$tesseraVeicoloEnumValueOf(name);
}
