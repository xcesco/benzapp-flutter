// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_change_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PasswordChangeDTO> _$passwordChangeDTOSerializer =
    new _$PasswordChangeDTOSerializer();

class _$PasswordChangeDTOSerializer
    implements StructuredSerializer<PasswordChangeDTO> {
  @override
  final Iterable<Type> types = const [PasswordChangeDTO, _$PasswordChangeDTO];
  @override
  final String wireName = 'PasswordChangeDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, PasswordChangeDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.currentPassword;
    if (value != null) {
      result
        ..add('currentPassword')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.newPassword;
    if (value != null) {
      result
        ..add('newPassword')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PasswordChangeDTO deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PasswordChangeDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currentPassword':
          result.currentPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'newPassword':
          result.newPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PasswordChangeDTO extends PasswordChangeDTO {
  @override
  final String? currentPassword;
  @override
  final String? newPassword;

  factory _$PasswordChangeDTO(
          [void Function(PasswordChangeDTOBuilder)? updates]) =>
      (new PasswordChangeDTOBuilder()..update(updates)).build();

  _$PasswordChangeDTO._({this.currentPassword, this.newPassword}) : super._();

  @override
  PasswordChangeDTO rebuild(void Function(PasswordChangeDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordChangeDTOBuilder toBuilder() =>
      new PasswordChangeDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordChangeDTO &&
        currentPassword == other.currentPassword &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, currentPassword.hashCode), newPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PasswordChangeDTO')
          ..add('currentPassword', currentPassword)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class PasswordChangeDTOBuilder
    implements Builder<PasswordChangeDTO, PasswordChangeDTOBuilder> {
  _$PasswordChangeDTO? _$v;

  String? _currentPassword;
  String? get currentPassword => _$this._currentPassword;
  set currentPassword(String? currentPassword) =>
      _$this._currentPassword = currentPassword;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  PasswordChangeDTOBuilder() {
    PasswordChangeDTO._initializeBuilder(this);
  }

  PasswordChangeDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPassword = $v.currentPassword;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordChangeDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasswordChangeDTO;
  }

  @override
  void update(void Function(PasswordChangeDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PasswordChangeDTO build() {
    final _$result = _$v ??
        new _$PasswordChangeDTO._(
            currentPassword: currentPassword, newPassword: newPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
