// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDTO> _$userDTOSerializer = new _$UserDTOSerializer();

class _$UserDTOSerializer implements StructuredSerializer<UserDTO> {
  @override
  final Iterable<Type> types = const [UserDTO, _$UserDTO];
  @override
  final String wireName = 'UserDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.login;
    if (value != null) {
      result
        ..add('login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserDTO extends UserDTO {
  @override
  final int? id;
  @override
  final String? login;

  factory _$UserDTO([void Function(UserDTOBuilder)? updates]) =>
      (new UserDTOBuilder()..update(updates)).build();

  _$UserDTO._({this.id, this.login}) : super._();

  @override
  UserDTO rebuild(void Function(UserDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDTOBuilder toBuilder() => new UserDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDTO && id == other.id && login == other.login;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDTO')
          ..add('id', id)
          ..add('login', login))
        .toString();
  }
}

class UserDTOBuilder implements Builder<UserDTO, UserDTOBuilder> {
  _$UserDTO? _$v;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _login;

  String? get login => _$this._login;

  set login(String? login) => _$this._login = login;

  UserDTOBuilder() {
    UserDTO._initializeBuilder(this);
  }

  UserDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _login = $v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDTO;
  }

  @override
  void update(void Function(UserDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDTO build() {
    final _$result = _$v ?? new _$UserDTO._(id: id, login: login);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
