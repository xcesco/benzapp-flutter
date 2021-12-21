import 'package:benzapp_flutter/model/gestore.dart';
import 'package:benzapp_flutter/model/tessera.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rifornimento.g.dart';

abstract class Rifornimento
    implements Built<Rifornimento, RifornimentoBuilder> {
  @BuiltValueField(wireName: r'data')
  DateTime? get data;

  @BuiltValueField(wireName: r'gestore')
  Gestore? get gestore;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'litriErogati')
  double? get litriErogati;

  @BuiltValueField(wireName: r'prezzoAlLitro')
  double? get prezzoAlLitro;

  @BuiltValueField(wireName: r'sconto')
  double? get sconto;

  @BuiltValueField(wireName: r'tessera')
  Tessera? get tessera;

  @BuiltValueField(wireName: r'tipoCarburante')
  RifornimentoTipoCarburanteEnum? get tipoCarburante;

  // enum tipoCarburanteEnum {  BENZINA,  DIESEL,  };

  // Boilerplate code needed to wire-up generated code
  Rifornimento._();

  static void _initializeBuilder(RifornimentoBuilder b) => b;

  factory Rifornimento([updates(RifornimentoBuilder b)]) = _$Rifornimento;

  static Serializer<Rifornimento> get serializer => _$rifornimentoSerializer;
}

class RifornimentoTipoCarburanteEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'BENZINA')
  static const RifornimentoTipoCarburanteEnum BENZINA =
      _$rifornimentoTipoCarburanteEnum_BENZINA;
  @BuiltValueEnumConst(wireName: r'DIESEL')
  static const RifornimentoTipoCarburanteEnum DIESEL =
      _$rifornimentoTipoCarburanteEnum_DIESEL;

  static Serializer<RifornimentoTipoCarburanteEnum> get serializer =>
      _$rifornimentoTipoCarburanteEnumSerializer;

  const RifornimentoTipoCarburanteEnum._(String name) : super(name);

  static BuiltSet<RifornimentoTipoCarburanteEnum> get values =>
      _$rifornimentoTipoCarburanteEnumValues;

  static RifornimentoTipoCarburanteEnum valueOf(String name) =>
      _$rifornimentoTipoCarburanteEnumValueOf(name);
}
