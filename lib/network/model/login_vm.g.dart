// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginVM> _$loginVMSerializer = new _$LoginVMSerializer();

class _$LoginVMSerializer implements StructuredSerializer<LoginVM> {
  @override
  final Iterable<Type> types = const [LoginVM, _$LoginVM];
  @override
  final String wireName = 'LoginVM';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoginVM object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rememberMe;
    if (value != null) {
      result
        ..add('rememberMe')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LoginVM deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginVMBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rememberMe':
          result.rememberMe = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginVM extends LoginVM {
  @override
  final String? password;
  @override
  final bool? rememberMe;
  @override
  final String? username;

  factory _$LoginVM([void Function(LoginVMBuilder)? updates]) =>
      (new LoginVMBuilder()..update(updates)).build();

  _$LoginVM._({this.password, this.rememberMe, this.username}) : super._();

  @override
  LoginVM rebuild(void Function(LoginVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginVMBuilder toBuilder() => new LoginVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginVM &&
        password == other.password &&
        rememberMe == other.rememberMe &&
        username == other.username;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, password.hashCode), rememberMe.hashCode),
        username.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginVM')
          ..add('password', password)
          ..add('rememberMe', rememberMe)
          ..add('username', username))
        .toString();
  }
}

class LoginVMBuilder implements Builder<LoginVM, LoginVMBuilder> {
  _$LoginVM? _$v;

  String? _password;

  String? get password => _$this._password;

  set password(String? password) => _$this._password = password;

  bool? _rememberMe;

  bool? get rememberMe => _$this._rememberMe;

  set rememberMe(bool? rememberMe) => _$this._rememberMe = rememberMe;

  String? _username;

  String? get username => _$this._username;

  set username(String? username) => _$this._username = username;

  LoginVMBuilder() {
    LoginVM._initializeBuilder(this);
  }

  LoginVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _password = $v.password;
      _rememberMe = $v.rememberMe;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginVM;
  }

  @override
  void update(void Function(LoginVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginVM build() {
    final _$result = _$v ??
        new _$LoginVM._(
            password: password, rememberMe: rememberMe, username: username);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
