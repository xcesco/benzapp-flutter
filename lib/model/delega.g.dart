// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delega.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Delega> _$delegaSerializer = new _$DelegaSerializer();

class _$DelegaSerializer implements StructuredSerializer<Delega> {
  @override
  final Iterable<Type> types = const [Delega, _$Delega];
  @override
  final String wireName = 'Delega';

  @override
  Iterable<Object?> serialize(Serializers serializers, Delega object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cittadino;
    if (value != null) {
      result
        ..add('cittadino')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Cittadino)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tessera;
    if (value != null) {
      result
        ..add('tessera')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Tessera)));
    }
    return result;
  }

  @override
  Delega deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DelegaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cittadino':
          result.cittadino.replace(serializers.deserialize(value,
              specifiedType: const FullType(Cittadino))! as Cittadino);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tessera':
          result.tessera.replace(serializers.deserialize(value,
              specifiedType: const FullType(Tessera))! as Tessera);
          break;
      }
    }

    return result.build();
  }
}

class _$Delega extends Delega {
  @override
  final Cittadino? cittadino;
  @override
  final int? id;
  @override
  final Tessera? tessera;

  factory _$Delega([void Function(DelegaBuilder)? updates]) =>
      (new DelegaBuilder()..update(updates)).build();

  _$Delega._({this.cittadino, this.id, this.tessera}) : super._();

  @override
  Delega rebuild(void Function(DelegaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DelegaBuilder toBuilder() => new DelegaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Delega &&
        cittadino == other.cittadino &&
        id == other.id &&
        tessera == other.tessera;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, cittadino.hashCode), id.hashCode), tessera.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Delega')
          ..add('cittadino', cittadino)
          ..add('id', id)
          ..add('tessera', tessera))
        .toString();
  }
}

class DelegaBuilder implements Builder<Delega, DelegaBuilder> {
  _$Delega? _$v;

  CittadinoBuilder? _cittadino;
  CittadinoBuilder get cittadino =>
      _$this._cittadino ??= new CittadinoBuilder();
  set cittadino(CittadinoBuilder? cittadino) => _$this._cittadino = cittadino;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  TesseraBuilder? _tessera;
  TesseraBuilder get tessera => _$this._tessera ??= new TesseraBuilder();
  set tessera(TesseraBuilder? tessera) => _$this._tessera = tessera;

  DelegaBuilder() {
    Delega._initializeBuilder(this);
  }

  DelegaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cittadino = $v.cittadino?.toBuilder();
      _id = $v.id;
      _tessera = $v.tessera?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Delega other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Delega;
  }

  @override
  void update(void Function(DelegaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Delega build() {
    _$Delega _$result;
    try {
      _$result = _$v ??
          new _$Delega._(
              cittadino: _cittadino?.build(),
              id: id,
              tessera: _tessera?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cittadino';
        _cittadino?.build();

        _$failedField = 'tessera';
        _tessera?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Delega', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
