// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gestore.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GestoreTipoEnum _$gestoreTipoEnum_AUTOSTRADALE =
    const GestoreTipoEnum._('AUTOSTRADALE');
const GestoreTipoEnum _$gestoreTipoEnum_NAVALE =
    const GestoreTipoEnum._('NAVALE');
const GestoreTipoEnum _$gestoreTipoEnum_STRADALE =
    const GestoreTipoEnum._('STRADALE');

GestoreTipoEnum _$gestoreTipoEnumValueOf(String name) {
  switch (name) {
    case 'AUTOSTRADALE':
      return _$gestoreTipoEnum_AUTOSTRADALE;
    case 'NAVALE':
      return _$gestoreTipoEnum_NAVALE;
    case 'STRADALE':
      return _$gestoreTipoEnum_STRADALE;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GestoreTipoEnum> _$gestoreTipoEnumValues =
    new BuiltSet<GestoreTipoEnum>(const <GestoreTipoEnum>[
  _$gestoreTipoEnum_AUTOSTRADALE,
  _$gestoreTipoEnum_NAVALE,
  _$gestoreTipoEnum_STRADALE,
]);

Serializer<Gestore> _$gestoreSerializer = new _$GestoreSerializer();
Serializer<GestoreTipoEnum> _$gestoreTipoEnumSerializer =
    new _$GestoreTipoEnumSerializer();

class _$GestoreSerializer implements StructuredSerializer<Gestore> {
  @override
  final Iterable<Type> types = const [Gestore, _$Gestore];
  @override
  final String wireName = 'Gestore';

  @override
  Iterable<Object?> serialize(Serializers serializers, Gestore object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.benzinaPrezzoAlLitro;
    if (value != null) {
      result
        ..add('benzinaPrezzoAlLitro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.comune;
    if (value != null) {
      result
        ..add('comune')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gasolioPrezzoAlLitro;
    if (value != null) {
      result
        ..add('gasolioPrezzoAlLitro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.indirizzo;
    if (value != null) {
      result
        ..add('indirizzo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.latitudine;
    if (value != null) {
      result
        ..add('latitudine')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.longitudine;
    if (value != null) {
      result
        ..add('longitudine')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.marchio;
    if (value != null) {
      result
        ..add('marchio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Marchio)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.provincia;
    if (value != null) {
      result
        ..add('provincia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rifornimentos;
    if (value != null) {
      result
        ..add('rifornimentos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltSet, const [const FullType(Rifornimento)])));
    }
    value = object.tipo;
    if (value != null) {
      result
        ..add('tipo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GestoreTipoEnum)));
    }
    return result;
  }

  @override
  Gestore deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GestoreBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'benzinaPrezzoAlLitro':
          result.benzinaPrezzoAlLitro = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'comune':
          result.comune = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gasolioPrezzoAlLitro':
          result.gasolioPrezzoAlLitro = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'indirizzo':
          result.indirizzo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'latitudine':
          result.latitudine = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'longitudine':
          result.longitudine = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'marchio':
          result.marchio.replace(serializers.deserialize(value,
              specifiedType: const FullType(Marchio))! as Marchio);
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'provincia':
          result.provincia = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rifornimentos':
          result.rifornimentos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Rifornimento)]))!
              as BuiltSet<Object?>);
          break;
        case 'tipo':
          result.tipo = serializers.deserialize(value,
                  specifiedType: const FullType(GestoreTipoEnum))
              as GestoreTipoEnum?;
          break;
      }
    }

    return result.build();
  }
}

class _$GestoreTipoEnumSerializer
    implements PrimitiveSerializer<GestoreTipoEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'AUTOSTRADALE': 'AUTOSTRADALE',
    'NAVALE': 'NAVALE',
    'STRADALE': 'STRADALE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'AUTOSTRADALE': 'AUTOSTRADALE',
    'NAVALE': 'NAVALE',
    'STRADALE': 'STRADALE',
  };

  @override
  final Iterable<Type> types = const <Type>[GestoreTipoEnum];
  @override
  final String wireName = 'GestoreTipoEnum';

  @override
  Object serialize(Serializers serializers, GestoreTipoEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GestoreTipoEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GestoreTipoEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$Gestore extends Gestore {
  @override
  final double? benzinaPrezzoAlLitro;
  @override
  final String? comune;
  @override
  final double? gasolioPrezzoAlLitro;
  @override
  final int? id;
  @override
  final String? indirizzo;
  @override
  final double? latitudine;
  @override
  final double? longitudine;
  @override
  final Marchio? marchio;
  @override
  final String? owner;
  @override
  final String? provincia;
  @override
  final BuiltSet<Rifornimento>? rifornimentos;
  @override
  final GestoreTipoEnum? tipo;

  factory _$Gestore([void Function(GestoreBuilder)? updates]) =>
      (new GestoreBuilder()..update(updates)).build();

  _$Gestore._(
      {this.benzinaPrezzoAlLitro,
      this.comune,
      this.gasolioPrezzoAlLitro,
      this.id,
      this.indirizzo,
      this.latitudine,
      this.longitudine,
      this.marchio,
      this.owner,
      this.provincia,
      this.rifornimentos,
      this.tipo})
      : super._();

  @override
  Gestore rebuild(void Function(GestoreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GestoreBuilder toBuilder() => new GestoreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gestore &&
        benzinaPrezzoAlLitro == other.benzinaPrezzoAlLitro &&
        comune == other.comune &&
        gasolioPrezzoAlLitro == other.gasolioPrezzoAlLitro &&
        id == other.id &&
        indirizzo == other.indirizzo &&
        latitudine == other.latitudine &&
        longitudine == other.longitudine &&
        marchio == other.marchio &&
        owner == other.owner &&
        provincia == other.provincia &&
        rifornimentos == other.rifornimentos &&
        tipo == other.tipo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    0,
                                                    benzinaPrezzoAlLitro
                                                        .hashCode),
                                                comune.hashCode),
                                            gasolioPrezzoAlLitro.hashCode),
                                        id.hashCode),
                                    indirizzo.hashCode),
                                latitudine.hashCode),
                            longitudine.hashCode),
                        marchio.hashCode),
                    owner.hashCode),
                provincia.hashCode),
            rifornimentos.hashCode),
        tipo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Gestore')
          ..add('benzinaPrezzoAlLitro', benzinaPrezzoAlLitro)
          ..add('comune', comune)
          ..add('gasolioPrezzoAlLitro', gasolioPrezzoAlLitro)
          ..add('id', id)
          ..add('indirizzo', indirizzo)
          ..add('latitudine', latitudine)
          ..add('longitudine', longitudine)
          ..add('marchio', marchio)
          ..add('owner', owner)
          ..add('provincia', provincia)
          ..add('rifornimentos', rifornimentos)
          ..add('tipo', tipo))
        .toString();
  }
}

class GestoreBuilder implements Builder<Gestore, GestoreBuilder> {
  _$Gestore? _$v;

  double? _benzinaPrezzoAlLitro;
  double? get benzinaPrezzoAlLitro => _$this._benzinaPrezzoAlLitro;
  set benzinaPrezzoAlLitro(double? benzinaPrezzoAlLitro) =>
      _$this._benzinaPrezzoAlLitro = benzinaPrezzoAlLitro;

  String? _comune;
  String? get comune => _$this._comune;
  set comune(String? comune) => _$this._comune = comune;

  double? _gasolioPrezzoAlLitro;
  double? get gasolioPrezzoAlLitro => _$this._gasolioPrezzoAlLitro;
  set gasolioPrezzoAlLitro(double? gasolioPrezzoAlLitro) =>
      _$this._gasolioPrezzoAlLitro = gasolioPrezzoAlLitro;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _indirizzo;
  String? get indirizzo => _$this._indirizzo;
  set indirizzo(String? indirizzo) => _$this._indirizzo = indirizzo;

  double? _latitudine;
  double? get latitudine => _$this._latitudine;
  set latitudine(double? latitudine) => _$this._latitudine = latitudine;

  double? _longitudine;
  double? get longitudine => _$this._longitudine;
  set longitudine(double? longitudine) => _$this._longitudine = longitudine;

  MarchioBuilder? _marchio;
  MarchioBuilder get marchio => _$this._marchio ??= new MarchioBuilder();
  set marchio(MarchioBuilder? marchio) => _$this._marchio = marchio;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  String? _provincia;
  String? get provincia => _$this._provincia;
  set provincia(String? provincia) => _$this._provincia = provincia;

  SetBuilder<Rifornimento>? _rifornimentos;
  SetBuilder<Rifornimento> get rifornimentos =>
      _$this._rifornimentos ??= new SetBuilder<Rifornimento>();
  set rifornimentos(SetBuilder<Rifornimento>? rifornimentos) =>
      _$this._rifornimentos = rifornimentos;

  GestoreTipoEnum? _tipo;
  GestoreTipoEnum? get tipo => _$this._tipo;
  set tipo(GestoreTipoEnum? tipo) => _$this._tipo = tipo;

  GestoreBuilder() {
    Gestore._initializeBuilder(this);
  }

  GestoreBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _benzinaPrezzoAlLitro = $v.benzinaPrezzoAlLitro;
      _comune = $v.comune;
      _gasolioPrezzoAlLitro = $v.gasolioPrezzoAlLitro;
      _id = $v.id;
      _indirizzo = $v.indirizzo;
      _latitudine = $v.latitudine;
      _longitudine = $v.longitudine;
      _marchio = $v.marchio?.toBuilder();
      _owner = $v.owner;
      _provincia = $v.provincia;
      _rifornimentos = $v.rifornimentos?.toBuilder();
      _tipo = $v.tipo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Gestore other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Gestore;
  }

  @override
  void update(void Function(GestoreBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Gestore build() {
    _$Gestore _$result;
    try {
      _$result = _$v ??
          new _$Gestore._(
              benzinaPrezzoAlLitro: benzinaPrezzoAlLitro,
              comune: comune,
              gasolioPrezzoAlLitro: gasolioPrezzoAlLitro,
              id: id,
              indirizzo: indirizzo,
              latitudine: latitudine,
              longitudine: longitudine,
              marchio: _marchio?.build(),
              owner: owner,
              provincia: provincia,
              rifornimentos: _rifornimentos?.build(),
              tipo: tipo);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'marchio';
        _marchio?.build();

        _$failedField = 'rifornimentos';
        _rifornimentos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Gestore', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
