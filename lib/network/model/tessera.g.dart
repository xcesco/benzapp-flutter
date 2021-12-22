// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tessera.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TesseraCarburanteEnum _$tesseraCarburanteEnum_BENZINA =
    const TesseraCarburanteEnum._('BENZINA');
const TesseraCarburanteEnum _$tesseraCarburanteEnum_DIESEL =
    const TesseraCarburanteEnum._('DIESEL');

TesseraCarburanteEnum _$tesseraCarburanteEnumValueOf(String name) {
  switch (name) {
    case 'BENZINA':
      return _$tesseraCarburanteEnum_BENZINA;
    case 'DIESEL':
      return _$tesseraCarburanteEnum_DIESEL;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TesseraCarburanteEnum> _$tesseraCarburanteEnumValues =
    new BuiltSet<TesseraCarburanteEnum>(const <TesseraCarburanteEnum>[
  _$tesseraCarburanteEnum_BENZINA,
  _$tesseraCarburanteEnum_DIESEL,
]);

const TesseraVeicoloEnum _$tesseraVeicoloEnum_AUTOVEICOLO =
    const TesseraVeicoloEnum._('AUTOVEICOLO');
const TesseraVeicoloEnum _$tesseraVeicoloEnum_CICLOMOTORE =
    const TesseraVeicoloEnum._('CICLOMOTORE');
const TesseraVeicoloEnum _$tesseraVeicoloEnum_MOTOVEICOLO =
    const TesseraVeicoloEnum._('MOTOVEICOLO');

TesseraVeicoloEnum _$tesseraVeicoloEnumValueOf(String name) {
  switch (name) {
    case 'AUTOVEICOLO':
      return _$tesseraVeicoloEnum_AUTOVEICOLO;
    case 'CICLOMOTORE':
      return _$tesseraVeicoloEnum_CICLOMOTORE;
    case 'MOTOVEICOLO':
      return _$tesseraVeicoloEnum_MOTOVEICOLO;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TesseraVeicoloEnum> _$tesseraVeicoloEnumValues =
    new BuiltSet<TesseraVeicoloEnum>(const <TesseraVeicoloEnum>[
  _$tesseraVeicoloEnum_AUTOVEICOLO,
  _$tesseraVeicoloEnum_CICLOMOTORE,
  _$tesseraVeicoloEnum_MOTOVEICOLO,
]);

Serializer<Tessera> _$tesseraSerializer = new _$TesseraSerializer();
Serializer<TesseraCarburanteEnum> _$tesseraCarburanteEnumSerializer =
    new _$TesseraCarburanteEnumSerializer();
Serializer<TesseraVeicoloEnum> _$tesseraVeicoloEnumSerializer =
    new _$TesseraVeicoloEnumSerializer();

class _$TesseraSerializer implements StructuredSerializer<Tessera> {
  @override
  final Iterable<Type> types = const [Tessera, _$Tessera];
  @override
  final String wireName = 'Tessera';

  @override
  Iterable<Object?> serialize(Serializers serializers, Tessera object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.carburante;
    if (value != null) {
      result
        ..add('carburante')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TesseraCarburanteEnum)));
    }
    value = object.cittadino;
    if (value != null) {
      result
        ..add('cittadino')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Cittadino)));
    }
    value = object.codice;
    if (value != null) {
      result
        ..add('codice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dataEmissione;
    if (value != null) {
      result
        ..add('dataEmissione')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.delegas;
    if (value != null) {
      result
        ..add('delegas')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(Delega)])));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.immagine;
    if (value != null) {
      result
        ..add('immagine')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.immagineContentType;
    if (value != null) {
      result
        ..add('immagineContentType')
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
    value = object.targa;
    if (value != null) {
      result
        ..add('targa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.veicolo;
    if (value != null) {
      result
        ..add('veicolo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TesseraVeicoloEnum)));
    }
    return result;
  }

  @override
  Tessera deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TesseraBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'carburante':
          result.carburante = serializers.deserialize(value,
                  specifiedType: const FullType(TesseraCarburanteEnum))
              as TesseraCarburanteEnum?;
          break;
        case 'cittadino':
          result.cittadino.replace(serializers.deserialize(value,
              specifiedType: const FullType(Cittadino))! as Cittadino);
          break;
        case 'codice':
          result.codice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataEmissione':
          result.dataEmissione = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'delegas':
          result.delegas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(Delega)]))!
              as BuiltSet<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'immagine':
          result.immagine = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'immagineContentType':
          result.immagineContentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rifornimentos':
          result.rifornimentos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Rifornimento)]))!
              as BuiltSet<Object?>);
          break;
        case 'targa':
          result.targa = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'veicolo':
          result.veicolo = serializers.deserialize(value,
                  specifiedType: const FullType(TesseraVeicoloEnum))
              as TesseraVeicoloEnum?;
          break;
      }
    }

    return result.build();
  }
}

class _$TesseraCarburanteEnumSerializer
    implements PrimitiveSerializer<TesseraCarburanteEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'BENZINA': 'BENZINA',
    'DIESEL': 'DIESEL',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'BENZINA': 'BENZINA',
    'DIESEL': 'DIESEL',
  };

  @override
  final Iterable<Type> types = const <Type>[TesseraCarburanteEnum];
  @override
  final String wireName = 'TesseraCarburanteEnum';

  @override
  Object serialize(Serializers serializers, TesseraCarburanteEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TesseraCarburanteEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TesseraCarburanteEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$TesseraVeicoloEnumSerializer
    implements PrimitiveSerializer<TesseraVeicoloEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'AUTOVEICOLO': 'AUTOVEICOLO',
    'CICLOMOTORE': 'CICLOMOTORE',
    'MOTOVEICOLO': 'MOTOVEICOLO',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'AUTOVEICOLO': 'AUTOVEICOLO',
    'CICLOMOTORE': 'CICLOMOTORE',
    'MOTOVEICOLO': 'MOTOVEICOLO',
  };

  @override
  final Iterable<Type> types = const <Type>[TesseraVeicoloEnum];
  @override
  final String wireName = 'TesseraVeicoloEnum';

  @override
  Object serialize(Serializers serializers, TesseraVeicoloEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TesseraVeicoloEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TesseraVeicoloEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$Tessera extends Tessera {
  @override
  final TesseraCarburanteEnum? carburante;
  @override
  final Cittadino? cittadino;
  @override
  final String? codice;
  @override
  final DateTime? dataEmissione;
  @override
  final BuiltSet<Delega>? delegas;
  @override
  final int? id;
  @override
  final String? immagine;
  @override
  final String? immagineContentType;
  @override
  final BuiltSet<Rifornimento>? rifornimentos;
  @override
  final String? targa;
  @override
  final TesseraVeicoloEnum? veicolo;

  factory _$Tessera([void Function(TesseraBuilder)? updates]) =>
      (new TesseraBuilder()..update(updates)).build();

  _$Tessera._(
      {this.carburante,
      this.cittadino,
      this.codice,
      this.dataEmissione,
      this.delegas,
      this.id,
      this.immagine,
      this.immagineContentType,
      this.rifornimentos,
      this.targa,
      this.veicolo})
      : super._();

  @override
  Tessera rebuild(void Function(TesseraBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TesseraBuilder toBuilder() => new TesseraBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tessera &&
        carburante == other.carburante &&
        cittadino == other.cittadino &&
        codice == other.codice &&
        dataEmissione == other.dataEmissione &&
        delegas == other.delegas &&
        id == other.id &&
        immagine == other.immagine &&
        immagineContentType == other.immagineContentType &&
        rifornimentos == other.rifornimentos &&
        targa == other.targa &&
        veicolo == other.veicolo;
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
                                        $jc($jc(0, carburante.hashCode),
                                            cittadino.hashCode),
                                        codice.hashCode),
                                    dataEmissione.hashCode),
                                delegas.hashCode),
                            id.hashCode),
                        immagine.hashCode),
                    immagineContentType.hashCode),
                rifornimentos.hashCode),
            targa.hashCode),
        veicolo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Tessera')
          ..add('carburante', carburante)
          ..add('cittadino', cittadino)
          ..add('codice', codice)
          ..add('dataEmissione', dataEmissione)
          ..add('delegas', delegas)
          ..add('id', id)
          ..add('immagine', immagine)
          ..add('immagineContentType', immagineContentType)
          ..add('rifornimentos', rifornimentos)
          ..add('targa', targa)
          ..add('veicolo', veicolo))
        .toString();
  }
}

class TesseraBuilder implements Builder<Tessera, TesseraBuilder> {
  _$Tessera? _$v;

  TesseraCarburanteEnum? _carburante;

  TesseraCarburanteEnum? get carburante => _$this._carburante;

  set carburante(TesseraCarburanteEnum? carburante) =>
      _$this._carburante = carburante;

  CittadinoBuilder? _cittadino;

  CittadinoBuilder get cittadino =>
      _$this._cittadino ??= new CittadinoBuilder();

  set cittadino(CittadinoBuilder? cittadino) => _$this._cittadino = cittadino;

  String? _codice;

  String? get codice => _$this._codice;

  set codice(String? codice) => _$this._codice = codice;

  DateTime? _dataEmissione;

  DateTime? get dataEmissione => _$this._dataEmissione;

  set dataEmissione(DateTime? dataEmissione) =>
      _$this._dataEmissione = dataEmissione;

  SetBuilder<Delega>? _delegas;

  SetBuilder<Delega> get delegas =>
      _$this._delegas ??= new SetBuilder<Delega>();

  set delegas(SetBuilder<Delega>? delegas) => _$this._delegas = delegas;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _immagine;

  String? get immagine => _$this._immagine;

  set immagine(String? immagine) => _$this._immagine = immagine;

  String? _immagineContentType;

  String? get immagineContentType => _$this._immagineContentType;

  set immagineContentType(String? immagineContentType) =>
      _$this._immagineContentType = immagineContentType;

  SetBuilder<Rifornimento>? _rifornimentos;

  SetBuilder<Rifornimento> get rifornimentos =>
      _$this._rifornimentos ??= new SetBuilder<Rifornimento>();

  set rifornimentos(SetBuilder<Rifornimento>? rifornimentos) =>
      _$this._rifornimentos = rifornimentos;

  String? _targa;

  String? get targa => _$this._targa;

  set targa(String? targa) => _$this._targa = targa;

  TesseraVeicoloEnum? _veicolo;

  TesseraVeicoloEnum? get veicolo => _$this._veicolo;

  set veicolo(TesseraVeicoloEnum? veicolo) => _$this._veicolo = veicolo;

  TesseraBuilder() {
    Tessera._initializeBuilder(this);
  }

  TesseraBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _carburante = $v.carburante;
      _cittadino = $v.cittadino?.toBuilder();
      _codice = $v.codice;
      _dataEmissione = $v.dataEmissione;
      _delegas = $v.delegas?.toBuilder();
      _id = $v.id;
      _immagine = $v.immagine;
      _immagineContentType = $v.immagineContentType;
      _rifornimentos = $v.rifornimentos?.toBuilder();
      _targa = $v.targa;
      _veicolo = $v.veicolo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Tessera other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Tessera;
  }

  @override
  void update(void Function(TesseraBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Tessera build() {
    _$Tessera _$result;
    try {
      _$result = _$v ??
          new _$Tessera._(
              carburante: carburante,
              cittadino: _cittadino?.build(),
              codice: codice,
              dataEmissione: dataEmissione,
              delegas: _delegas?.build(),
              id: id,
              immagine: immagine,
              immagineContentType: immagineContentType,
              rifornimentos: _rifornimentos?.build(),
              targa: targa,
              veicolo: veicolo);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cittadino';
        _cittadino?.build();

        _$failedField = 'delegas';
        _delegas?.build();

        _$failedField = 'rifornimentos';
        _rifornimentos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Tessera', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
