// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marchio.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Marchio> _$marchioSerializer = new _$MarchioSerializer();

class _$MarchioSerializer implements StructuredSerializer<Marchio> {
  @override
  final Iterable<Type> types = const [Marchio, _$Marchio];
  @override
  final String wireName = 'Marchio';

  @override
  Iterable<Object?> serialize(Serializers serializers, Marchio object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.gestores;
    if (value != null) {
      result
        ..add('gestores')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(Gestore)])));
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
    value = object.nome;
    if (value != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Marchio deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MarchioBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'gestores':
          result.gestores.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Gestore)]))!
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
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Marchio extends Marchio {
  @override
  final BuiltSet<Gestore>? gestores;
  @override
  final int? id;
  @override
  final String? immagine;
  @override
  final String? immagineContentType;
  @override
  final String? nome;

  factory _$Marchio([void Function(MarchioBuilder)? updates]) =>
      (new MarchioBuilder()..update(updates)).build();

  _$Marchio._(
      {this.gestores,
      this.id,
      this.immagine,
      this.immagineContentType,
      this.nome})
      : super._();

  @override
  Marchio rebuild(void Function(MarchioBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MarchioBuilder toBuilder() => new MarchioBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Marchio &&
        gestores == other.gestores &&
        id == other.id &&
        immagine == other.immagine &&
        immagineContentType == other.immagineContentType &&
        nome == other.nome;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, gestores.hashCode), id.hashCode), immagine.hashCode),
            immagineContentType.hashCode),
        nome.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Marchio')
          ..add('gestores', gestores)
          ..add('id', id)
          ..add('immagine', immagine)
          ..add('immagineContentType', immagineContentType)
          ..add('nome', nome))
        .toString();
  }
}

class MarchioBuilder implements Builder<Marchio, MarchioBuilder> {
  _$Marchio? _$v;

  SetBuilder<Gestore>? _gestores;

  SetBuilder<Gestore> get gestores =>
      _$this._gestores ??= new SetBuilder<Gestore>();

  set gestores(SetBuilder<Gestore>? gestores) => _$this._gestores = gestores;

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

  String? _nome;

  String? get nome => _$this._nome;

  set nome(String? nome) => _$this._nome = nome;

  MarchioBuilder() {
    Marchio._initializeBuilder(this);
  }

  MarchioBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gestores = $v.gestores?.toBuilder();
      _id = $v.id;
      _immagine = $v.immagine;
      _immagineContentType = $v.immagineContentType;
      _nome = $v.nome;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Marchio other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Marchio;
  }

  @override
  void update(void Function(MarchioBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Marchio build() {
    _$Marchio _$result;
    try {
      _$result = _$v ??
          new _$Marchio._(
              gestores: _gestores?.build(),
              id: id,
              immagine: immagine,
              immagineContentType: immagineContentType,
              nome: nome);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'gestores';
        _gestores?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Marchio', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
