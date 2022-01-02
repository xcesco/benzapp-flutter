import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'marchio.dart';
import 'rifornimento.dart';

part 'gestore.g.dart';

abstract class Gestore implements Built<Gestore, GestoreBuilder> {
  @BuiltValueField(wireName: r'benzinaPrezzoAlLitro')
  double? get benzinaPrezzoAlLitro;

  @BuiltValueField(wireName: r'comune')
  String? get comune;

  @BuiltValueField(wireName: r'gasolioPrezzoAlLitro')
  double? get gasolioPrezzoAlLitro;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'indirizzo')
  String? get indirizzo;

  @BuiltValueField(wireName: r'latitudine')
  double? get latitudine;

  @BuiltValueField(wireName: r'longitudine')
  double? get longitudine;

  @BuiltValueField(wireName: r'marchio')
  Marchio? get marchio;

  @BuiltValueField(wireName: r'owner')
  String? get owner;

  @BuiltValueField(wireName: r'provincia')
  String? get provincia;

  @BuiltValueField(wireName: r'rifornimentos')
  BuiltSet<Rifornimento>? get rifornimentos;

  @BuiltValueField(wireName: r'tipo')
  GestoreTipoEnum? get tipo;

  // enum tipoEnum {  AUTOSTRADALE,  NAVALE,  STRADALE,  };

  // Boilerplate code needed to wire-up generated code
  Gestore._();

  static void _initializeBuilder(GestoreBuilder b) => b;

  factory Gestore([updates(GestoreBuilder b)]) = _$Gestore;

  static Serializer<Gestore> get serializer => _$gestoreSerializer;
}

class GestoreTipoEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'AUTOSTRADALE')
  static const GestoreTipoEnum AUTOSTRADALE = _$gestoreTipoEnum_AUTOSTRADALE;
  @BuiltValueEnumConst(wireName: r'NAVALE')
  static const GestoreTipoEnum NAVALE = _$gestoreTipoEnum_NAVALE;
  @BuiltValueEnumConst(wireName: r'STRADALE')
  static const GestoreTipoEnum STRADALE = _$gestoreTipoEnum_STRADALE;

  static Serializer<GestoreTipoEnum> get serializer =>
      _$gestoreTipoEnumSerializer;

  const GestoreTipoEnum._(String name) : super(name);

  static BuiltSet<GestoreTipoEnum> get values => _$gestoreTipoEnumValues;

  static GestoreTipoEnum valueOf(String name) => _$gestoreTipoEnumValueOf(name);
}
