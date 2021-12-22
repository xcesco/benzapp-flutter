// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_and_password_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KeyAndPasswordVM> _$keyAndPasswordVMSerializer =
    new _$KeyAndPasswordVMSerializer();

class _$KeyAndPasswordVMSerializer
    implements StructuredSerializer<KeyAndPasswordVM> {
  @override
  final Iterable<Type> types = const [KeyAndPasswordVM, _$KeyAndPasswordVM];
  @override
  final String wireName = 'KeyAndPasswordVM';

  @override
  Iterable<Object?> serialize(Serializers serializers, KeyAndPasswordVM object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.key;
    if (value != null) {
      result
        ..add('key')
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
  KeyAndPasswordVM deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KeyAndPasswordVMBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
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

class _$KeyAndPasswordVM extends KeyAndPasswordVM {
  @override
  final String? key;
  @override
  final String? newPassword;

  factory _$KeyAndPasswordVM(
          [void Function(KeyAndPasswordVMBuilder)? updates]) =>
      (new KeyAndPasswordVMBuilder()..update(updates)).build();

  _$KeyAndPasswordVM._({this.key, this.newPassword}) : super._();

  @override
  KeyAndPasswordVM rebuild(void Function(KeyAndPasswordVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KeyAndPasswordVMBuilder toBuilder() =>
      new KeyAndPasswordVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KeyAndPasswordVM &&
        key == other.key &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), newPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KeyAndPasswordVM')
          ..add('key', key)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class KeyAndPasswordVMBuilder
    implements Builder<KeyAndPasswordVM, KeyAndPasswordVMBuilder> {
  _$KeyAndPasswordVM? _$v;

  String? _key;

  String? get key => _$this._key;

  set key(String? key) => _$this._key = key;

  String? _newPassword;

  String? get newPassword => _$this._newPassword;

  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  KeyAndPasswordVMBuilder() {
    KeyAndPasswordVM._initializeBuilder(this);
  }

  KeyAndPasswordVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KeyAndPasswordVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KeyAndPasswordVM;
  }

  @override
  void update(void Function(KeyAndPasswordVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KeyAndPasswordVM build() {
    final _$result =
        _$v ?? new _$KeyAndPasswordVM._(key: key, newPassword: newPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
