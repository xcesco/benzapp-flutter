// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifica_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificaDTO> _$notificaDTOSerializer = new _$NotificaDTOSerializer();

class _$NotificaDTOSerializer implements StructuredSerializer<NotificaDTO> {
  @override
  final Iterable<Type> types = const [NotificaDTO, _$NotificaDTO];
  @override
  final String wireName = 'NotificaDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificaDTO object,
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
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.targa;
    if (value != null) {
      result
        ..add('targa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificaDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificaDTOBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'targa':
          result.targa = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificaDTO extends NotificaDTO {
  @override
  final DateTime? data;
  @override
  final int? id;
  @override
  final String? targa;

  factory _$NotificaDTO([void Function(NotificaDTOBuilder)? updates]) =>
      (new NotificaDTOBuilder()..update(updates)).build();

  _$NotificaDTO._({this.data, this.id, this.targa}) : super._();

  @override
  NotificaDTO rebuild(void Function(NotificaDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificaDTOBuilder toBuilder() => new NotificaDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificaDTO &&
        data == other.data &&
        id == other.id &&
        targa == other.targa;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, data.hashCode), id.hashCode), targa.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotificaDTO')
          ..add('data', data)
          ..add('id', id)
          ..add('targa', targa))
        .toString();
  }
}

class NotificaDTOBuilder implements Builder<NotificaDTO, NotificaDTOBuilder> {
  _$NotificaDTO? _$v;

  DateTime? _data;

  DateTime? get data => _$this._data;

  set data(DateTime? data) => _$this._data = data;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _targa;

  String? get targa => _$this._targa;

  set targa(String? targa) => _$this._targa = targa;

  NotificaDTOBuilder() {
    NotificaDTO._initializeBuilder(this);
  }

  NotificaDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _id = $v.id;
      _targa = $v.targa;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificaDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificaDTO;
  }

  @override
  void update(void Function(NotificaDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NotificaDTO build() {
    final _$result =
        _$v ?? new _$NotificaDTO._(data: data, id: id, targa: targa);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
