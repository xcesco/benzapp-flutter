// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cittadino.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************


Serializer<Cittadino> _$cittadinoSerializer = new _$CittadinoSerializer();

class _$CittadinoSerializer implements StructuredSerializer<Cittadino> {
  @override
  final Iterable<Type> types = const [Cittadino, _$Cittadino];
  @override
  final String wireName = 'Cittadino';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cittadino object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.codiceFiscale;
    if (value != null) {
      result
        ..add('codiceFiscale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cognome;
    if (value != null) {
      result
        ..add('cognome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.delegas;
    if (value != null) {
      result
        ..add('delegas')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(Delega)])));
    }
    value = object.fascia;
    if (value != null) {
      result
        ..add('fascia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Fascia)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nome;
    if (value != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tesseras;
    if (value != null) {
      result
        ..add('tesseras')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(Tessera)])));
    }
    return result;
  }

  @override
  Cittadino deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CittadinoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'codiceFiscale':
          result.codiceFiscale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cognome':
          result.cognome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'delegas':
          result.delegas.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(Delega)]))!
              as BuiltSet<Object?>);
          break;
        case 'fascia':
          result.fascia.replace(serializers.deserialize(value,
              specifiedType: const FullType(Fascia))! as Fascia);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tesseras':
          result.tesseras.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Tessera)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Cittadino extends Cittadino {
  @override
  final String? codiceFiscale;
  @override
  final String? cognome;
  @override
  final BuiltSet<Delega>? delegas;
  @override
  final Fascia? fascia;
  @override
  final int? id;
  @override
  final String? nome;
  @override
  final String? owner;
  @override
  final BuiltSet<Tessera>? tesseras;

  factory _$Cittadino([void Function(CittadinoBuilder)? updates]) =>
      (new CittadinoBuilder()..update(updates)).build();

  _$Cittadino._(
      {this.codiceFiscale,
      this.cognome,
      this.delegas,
      this.fascia,
      this.id,
      this.nome,
      this.owner,
      this.tesseras})
      : super._();

  @override
  Cittadino rebuild(void Function(CittadinoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CittadinoBuilder toBuilder() => new CittadinoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cittadino &&
        codiceFiscale == other.codiceFiscale &&
        cognome == other.cognome &&
        delegas == other.delegas &&
        fascia == other.fascia &&
        id == other.id &&
        nome == other.nome &&
        owner == other.owner &&
        tesseras == other.tesseras;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, codiceFiscale.hashCode),
                                cognome.hashCode),
                            delegas.hashCode),
                        fascia.hashCode),
                    id.hashCode),
                nome.hashCode),
            owner.hashCode),
        tesseras.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cittadino')
          ..add('codiceFiscale', codiceFiscale)
          ..add('cognome', cognome)
          ..add('delegas', delegas)
          ..add('fascia', fascia)
          ..add('id', id)
          ..add('nome', nome)
          ..add('owner', owner)
          ..add('tesseras', tesseras))
        .toString();
  }
}

class CittadinoBuilder implements Builder<Cittadino, CittadinoBuilder> {
  _$Cittadino? _$v;

  String? _codiceFiscale;

  String? get codiceFiscale => _$this._codiceFiscale;

  set codiceFiscale(String? codiceFiscale) =>
      _$this._codiceFiscale = codiceFiscale;

  String? _cognome;

  String? get cognome => _$this._cognome;

  set cognome(String? cognome) => _$this._cognome = cognome;

  SetBuilder<Delega>? _delegas;

  SetBuilder<Delega> get delegas =>
      _$this._delegas ??= new SetBuilder<Delega>();

  set delegas(SetBuilder<Delega>? delegas) => _$this._delegas = delegas;

  FasciaBuilder? _fascia;

  FasciaBuilder get fascia => _$this._fascia ??= new FasciaBuilder();

  set fascia(FasciaBuilder? fascia) => _$this._fascia = fascia;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _nome;

  String? get nome => _$this._nome;

  set nome(String? nome) => _$this._nome = nome;

  String? _owner;

  String? get owner => _$this._owner;

  set owner(String? owner) => _$this._owner = owner;

  SetBuilder<Tessera>? _tesseras;

  SetBuilder<Tessera> get tesseras =>
      _$this._tesseras ??= new SetBuilder<Tessera>();

  set tesseras(SetBuilder<Tessera>? tesseras) => _$this._tesseras = tesseras;

  CittadinoBuilder() {
    Cittadino._initializeBuilder(this);
  }

  CittadinoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _codiceFiscale = $v.codiceFiscale;
      _cognome = $v.cognome;
      _delegas = $v.delegas?.toBuilder();
      _fascia = $v.fascia?.toBuilder();
      _id = $v.id;
      _nome = $v.nome;
      _owner = $v.owner;
      _tesseras = $v.tesseras?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cittadino other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cittadino;
  }

  @override
  void update(void Function(CittadinoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Cittadino build() {
    _$Cittadino _$result;
    try {
      _$result = _$v ??
          new _$Cittadino._(
              codiceFiscale: codiceFiscale,
              cognome: cognome,
              delegas: _delegas?.build(),
              fascia: _fascia?.build(),
              id: id,
              nome: nome,
              owner: owner,
              tesseras: _tesseras?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'delegas';
        _delegas?.build();
        _$failedField = 'fascia';
        _fascia?.build();

        _$failedField = 'tesseras';
        _tesseras?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Cittadino', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
