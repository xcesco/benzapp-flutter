// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rifornimento.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RifornimentoTipoCarburanteEnum _$rifornimentoTipoCarburanteEnum_BENZINA =
    const RifornimentoTipoCarburanteEnum._('BENZINA');
const RifornimentoTipoCarburanteEnum _$rifornimentoTipoCarburanteEnum_DIESEL =
    const RifornimentoTipoCarburanteEnum._('DIESEL');

RifornimentoTipoCarburanteEnum _$rifornimentoTipoCarburanteEnumValueOf(
    String name) {
  switch (name) {
    case 'BENZINA':
      return _$rifornimentoTipoCarburanteEnum_BENZINA;
    case 'DIESEL':
      return _$rifornimentoTipoCarburanteEnum_DIESEL;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<RifornimentoTipoCarburanteEnum>
    _$rifornimentoTipoCarburanteEnumValues = new BuiltSet<
        RifornimentoTipoCarburanteEnum>(const <RifornimentoTipoCarburanteEnum>[
  _$rifornimentoTipoCarburanteEnum_BENZINA,
  _$rifornimentoTipoCarburanteEnum_DIESEL,
]);

Serializer<Rifornimento> _$rifornimentoSerializer =
    new _$RifornimentoSerializer();
Serializer<RifornimentoTipoCarburanteEnum>
    _$rifornimentoTipoCarburanteEnumSerializer =
    new _$RifornimentoTipoCarburanteEnumSerializer();

class _$RifornimentoSerializer implements StructuredSerializer<Rifornimento> {
  @override
  final Iterable<Type> types = const [Rifornimento, _$Rifornimento];
  @override
  final String wireName = 'Rifornimento';

  @override
  Iterable<Object?> serialize(Serializers serializers, Rifornimento object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.gestore;
    if (value != null) {
      result
        ..add('gestore')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Gestore)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.litriErogati;
    if (value != null) {
      result
        ..add('litriErogati')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.prezzoAlLitro;
    if (value != null) {
      result
        ..add('prezzoAlLitro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sconto;
    if (value != null) {
      result
        ..add('sconto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tessera;
    if (value != null) {
      result
        ..add('tessera')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Tessera)));
    }
    value = object.tipoCarburante;
    if (value != null) {
      result
        ..add('tipoCarburante')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(RifornimentoTipoCarburanteEnum)));
    }
    return result;
  }

  @override
  Rifornimento deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RifornimentoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'gestore':
          result.gestore.replace(serializers.deserialize(value,
              specifiedType: const FullType(Gestore))! as Gestore);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'litriErogati':
          result.litriErogati = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'prezzoAlLitro':
          result.prezzoAlLitro = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sconto':
          result.sconto = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tessera':
          result.tessera.replace(serializers.deserialize(value,
              specifiedType: const FullType(Tessera))! as Tessera);
          break;
        case 'tipoCarburante':
          result.tipoCarburante = serializers.deserialize(value,
                  specifiedType: const FullType(RifornimentoTipoCarburanteEnum))
              as RifornimentoTipoCarburanteEnum?;
          break;
      }
    }

    return result.build();
  }
}

class _$RifornimentoTipoCarburanteEnumSerializer
    implements PrimitiveSerializer<RifornimentoTipoCarburanteEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'BENZINA': 'BENZINA',
    'DIESEL': 'DIESEL',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'BENZINA': 'BENZINA',
    'DIESEL': 'DIESEL',
  };

  @override
  final Iterable<Type> types = const <Type>[RifornimentoTipoCarburanteEnum];
  @override
  final String wireName = 'RifornimentoTipoCarburanteEnum';

  @override
  Object serialize(
          Serializers serializers, RifornimentoTipoCarburanteEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RifornimentoTipoCarburanteEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RifornimentoTipoCarburanteEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$Rifornimento extends Rifornimento {
  @override
  final DateTime? data;
  @override
  final Gestore? gestore;
  @override
  final int? id;
  @override
  final double? litriErogati;
  @override
  final double? prezzoAlLitro;
  @override
  final double? sconto;
  @override
  final Tessera? tessera;
  @override
  final RifornimentoTipoCarburanteEnum? tipoCarburante;

  factory _$Rifornimento([void Function(RifornimentoBuilder)? updates]) =>
      (new RifornimentoBuilder()..update(updates)).build();

  _$Rifornimento._(
      {this.data,
      this.gestore,
      this.id,
      this.litriErogati,
      this.prezzoAlLitro,
      this.sconto,
      this.tessera,
      this.tipoCarburante})
      : super._();

  @override
  Rifornimento rebuild(void Function(RifornimentoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RifornimentoBuilder toBuilder() => new RifornimentoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Rifornimento &&
        data == other.data &&
        gestore == other.gestore &&
        id == other.id &&
        litriErogati == other.litriErogati &&
        prezzoAlLitro == other.prezzoAlLitro &&
        sconto == other.sconto &&
        tessera == other.tessera &&
        tipoCarburante == other.tipoCarburante;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, data.hashCode), gestore.hashCode),
                            id.hashCode),
                        litriErogati.hashCode),
                    prezzoAlLitro.hashCode),
                sconto.hashCode),
            tessera.hashCode),
        tipoCarburante.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Rifornimento')
          ..add('data', data)
          ..add('gestore', gestore)
          ..add('id', id)
          ..add('litriErogati', litriErogati)
          ..add('prezzoAlLitro', prezzoAlLitro)
          ..add('sconto', sconto)
          ..add('tessera', tessera)
          ..add('tipoCarburante', tipoCarburante))
        .toString();
  }
}

class RifornimentoBuilder
    implements Builder<Rifornimento, RifornimentoBuilder> {
  _$Rifornimento? _$v;

  DateTime? _data;
  DateTime? get data => _$this._data;
  set data(DateTime? data) => _$this._data = data;

  GestoreBuilder? _gestore;
  GestoreBuilder get gestore => _$this._gestore ??= new GestoreBuilder();
  set gestore(GestoreBuilder? gestore) => _$this._gestore = gestore;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  double? _litriErogati;
  double? get litriErogati => _$this._litriErogati;
  set litriErogati(double? litriErogati) => _$this._litriErogati = litriErogati;

  double? _prezzoAlLitro;
  double? get prezzoAlLitro => _$this._prezzoAlLitro;
  set prezzoAlLitro(double? prezzoAlLitro) =>
      _$this._prezzoAlLitro = prezzoAlLitro;

  double? _sconto;
  double? get sconto => _$this._sconto;
  set sconto(double? sconto) => _$this._sconto = sconto;

  TesseraBuilder? _tessera;
  TesseraBuilder get tessera => _$this._tessera ??= new TesseraBuilder();
  set tessera(TesseraBuilder? tessera) => _$this._tessera = tessera;

  RifornimentoTipoCarburanteEnum? _tipoCarburante;
  RifornimentoTipoCarburanteEnum? get tipoCarburante => _$this._tipoCarburante;
  set tipoCarburante(RifornimentoTipoCarburanteEnum? tipoCarburante) =>
      _$this._tipoCarburante = tipoCarburante;

  RifornimentoBuilder() {
    Rifornimento._initializeBuilder(this);
  }

  RifornimentoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _gestore = $v.gestore?.toBuilder();
      _id = $v.id;
      _litriErogati = $v.litriErogati;
      _prezzoAlLitro = $v.prezzoAlLitro;
      _sconto = $v.sconto;
      _tessera = $v.tessera?.toBuilder();
      _tipoCarburante = $v.tipoCarburante;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Rifornimento other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Rifornimento;
  }

  @override
  void update(void Function(RifornimentoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Rifornimento build() {
    _$Rifornimento _$result;
    try {
      _$result = _$v ??
          new _$Rifornimento._(
              data: data,
              gestore: _gestore?.build(),
              id: id,
              litriErogati: litriErogati,
              prezzoAlLitro: prezzoAlLitro,
              sconto: sconto,
              tessera: _tessera?.build(),
              tipoCarburante: tipoCarburante);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'gestore';
        _gestore?.build();

        _$failedField = 'tessera';
        _tessera?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Rifornimento', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
