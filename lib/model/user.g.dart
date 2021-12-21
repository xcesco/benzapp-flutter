// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.activated;
    if (value != null) {
      result
        ..add('activated')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.langKey;
    if (value != null) {
      result
        ..add('langKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.login;
    if (value != null) {
      result
        ..add('login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.resetDate;
    if (value != null) {
      result
        ..add('resetDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'activated':
          result.activated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'langKey':
          result.langKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'resetDate':
          result.resetDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final bool? activated;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final int? id;
  @override
  final String? imageUrl;
  @override
  final String? langKey;
  @override
  final String? lastName;
  @override
  final String? login;
  @override
  final DateTime? resetDate;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.activated,
      this.email,
      this.firstName,
      this.id,
      this.imageUrl,
      this.langKey,
      this.lastName,
      this.login,
      this.resetDate})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        activated == other.activated &&
        email == other.email &&
        firstName == other.firstName &&
        id == other.id &&
        imageUrl == other.imageUrl &&
        langKey == other.langKey &&
        lastName == other.lastName &&
        login == other.login &&
        resetDate == other.resetDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, activated.hashCode), email.hashCode),
                                firstName.hashCode),
                            id.hashCode),
                        imageUrl.hashCode),
                    langKey.hashCode),
                lastName.hashCode),
            login.hashCode),
        resetDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('activated', activated)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('id', id)
          ..add('imageUrl', imageUrl)
          ..add('langKey', langKey)
          ..add('lastName', lastName)
          ..add('login', login)
          ..add('resetDate', resetDate))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  bool? _activated;

  bool? get activated => _$this._activated;

  set activated(bool? activated) => _$this._activated = activated;

  String? _email;

  String? get email => _$this._email;

  set email(String? email) => _$this._email = email;

  String? _firstName;

  String? get firstName => _$this._firstName;

  set firstName(String? firstName) => _$this._firstName = firstName;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _imageUrl;

  String? get imageUrl => _$this._imageUrl;

  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _langKey;

  String? get langKey => _$this._langKey;

  set langKey(String? langKey) => _$this._langKey = langKey;

  String? _lastName;

  String? get lastName => _$this._lastName;

  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _login;

  String? get login => _$this._login;

  set login(String? login) => _$this._login = login;

  DateTime? _resetDate;

  DateTime? get resetDate => _$this._resetDate;

  set resetDate(DateTime? resetDate) => _$this._resetDate = resetDate;

  UserBuilder() {
    User._initializeBuilder(this);
  }

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _activated = $v.activated;
      _email = $v.email;
      _firstName = $v.firstName;
      _id = $v.id;
      _imageUrl = $v.imageUrl;
      _langKey = $v.langKey;
      _lastName = $v.lastName;
      _login = $v.login;
      _resetDate = $v.resetDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            activated: activated,
            email: email,
            firstName: firstName,
            id: id,
            imageUrl: imageUrl,
            langKey: langKey,
            lastName: lastName,
            login: login,
            resetDate: resetDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
