// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fascia.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Fascia> _$fasciaSerializer = new _$FasciaSerializer();

class _$FasciaSerializer implements StructuredSerializer<Fascia> {
  @override
  final Iterable<Type> types = const [Fascia, _$Fascia];
  @override
  final String wireName = 'Fascia';

  @override
  Iterable<Object?> serialize(Serializers serializers, Fascia object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cittadinos;
    if (value != null) {
      result
        ..add('cittadinos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(Cittadino)])));
    }
    value = object.descrizione;
    if (value != null) {
      result
        ..add('descrizione')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.scontoBenzina;
    if (value != null) {
      result
        ..add('scontoBenzina')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.scontoGasolio;
    if (value != null) {
      result
        ..add('scontoGasolio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Fascia deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FasciaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cittadinos':
          result.cittadinos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Cittadino)]))!
              as BuiltSet<Object?>);
          break;
        case 'descrizione':
          result.descrizione = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'scontoBenzina':
          result.scontoBenzina = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'scontoGasolio':
          result.scontoGasolio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$Fascia extends Fascia {
  @override
  final BuiltSet<Cittadino>? cittadinos;
  @override
  final String? descrizione;
  @override
  final int? id;
  @override
  final double? scontoBenzina;
  @override
  final double? scontoGasolio;

  factory _$Fascia([void Function(FasciaBuilder)? updates]) =>
      (new FasciaBuilder()..update(updates)).build();

  _$Fascia._(
      {this.cittadinos,
      this.descrizione,
      this.id,
      this.scontoBenzina,
      this.scontoGasolio})
      : super._();

  @override
  Fascia rebuild(void Function(FasciaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FasciaBuilder toBuilder() => new FasciaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Fascia &&
        cittadinos == other.cittadinos &&
        descrizione == other.descrizione &&
        id == other.id &&
        scontoBenzina == other.scontoBenzina &&
        scontoGasolio == other.scontoGasolio;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, cittadinos.hashCode), descrizione.hashCode),
                id.hashCode),
            scontoBenzina.hashCode),
        scontoGasolio.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Fascia')
          ..add('cittadinos', cittadinos)
          ..add('descrizione', descrizione)
          ..add('id', id)
          ..add('scontoBenzina', scontoBenzina)
          ..add('scontoGasolio', scontoGasolio))
        .toString();
  }
}

class FasciaBuilder implements Builder<Fascia, FasciaBuilder> {
  _$Fascia? _$v;

  SetBuilder<Cittadino>? _cittadinos;

  SetBuilder<Cittadino> get cittadinos =>
      _$this._cittadinos ??= new SetBuilder<Cittadino>();

  set cittadinos(SetBuilder<Cittadino>? cittadinos) =>
      _$this._cittadinos = cittadinos;

  String? _descrizione;

  String? get descrizione => _$this._descrizione;

  set descrizione(String? descrizione) => _$this._descrizione = descrizione;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  double? _scontoBenzina;

  double? get scontoBenzina => _$this._scontoBenzina;

  set scontoBenzina(double? scontoBenzina) =>
      _$this._scontoBenzina = scontoBenzina;

  double? _scontoGasolio;

  double? get scontoGasolio => _$this._scontoGasolio;

  set scontoGasolio(double? scontoGasolio) =>
      _$this._scontoGasolio = scontoGasolio;

  FasciaBuilder() {
    Fascia._initializeBuilder(this);
  }

  FasciaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cittadinos = $v.cittadinos?.toBuilder();
      _descrizione = $v.descrizione;
      _id = $v.id;
      _scontoBenzina = $v.scontoBenzina;
      _scontoGasolio = $v.scontoGasolio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Fascia other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Fascia;
  }

  @override
  void update(void Function(FasciaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Fascia build() {
    _$Fascia _$result;
    try {
      _$result = _$v ??
          new _$Fascia._(
              cittadinos: _cittadinos?.build(),
              descrizione: descrizione,
              id: id,
              scontoBenzina: scontoBenzina,
              scontoGasolio: scontoGasolio);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cittadinos';
        _cittadinos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Fascia', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
