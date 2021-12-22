// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdminUserDTO> _$adminUserDTOSerializer =
    new _$AdminUserDTOSerializer();

class _$AdminUserDTOSerializer implements StructuredSerializer<AdminUserDTO> {
  @override
  final Iterable<Type> types = const [AdminUserDTO, _$AdminUserDTO];
  @override
  final String wireName = 'AdminUserDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdminUserDTO object,
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
    value = object.authorities;
    if (value != null) {
      result
        ..add('authorities')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(String)])));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('createdBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
    value = object.lastModifiedBy;
    if (value != null) {
      result
        ..add('lastModifiedBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastModifiedDate;
    if (value != null) {
      result
        ..add('lastModifiedDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
    return result;
  }

  @override
  AdminUserDTO deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdminUserDTOBuilder();

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
        case 'authorities':
          result.authorities.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'createdBy':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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
        case 'lastModifiedBy':
          result.lastModifiedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastModifiedDate':
          result.lastModifiedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$AdminUserDTO extends AdminUserDTO {
  @override
  final bool? activated;
  @override
  final BuiltSet<String>? authorities;
  @override
  final String? createdBy;
  @override
  final DateTime? createdDate;
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
  final String? lastModifiedBy;
  @override
  final DateTime? lastModifiedDate;
  @override
  final String? lastName;
  @override
  final String? login;

  factory _$AdminUserDTO([void Function(AdminUserDTOBuilder)? updates]) =>
      (new AdminUserDTOBuilder()..update(updates)).build();

  _$AdminUserDTO._(
      {this.activated,
      this.authorities,
      this.createdBy,
      this.createdDate,
      this.email,
      this.firstName,
      this.id,
      this.imageUrl,
      this.langKey,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.lastName,
      this.login})
      : super._();

  @override
  AdminUserDTO rebuild(void Function(AdminUserDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminUserDTOBuilder toBuilder() => new AdminUserDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminUserDTO &&
        activated == other.activated &&
        authorities == other.authorities &&
        createdBy == other.createdBy &&
        createdDate == other.createdDate &&
        email == other.email &&
        firstName == other.firstName &&
        id == other.id &&
        imageUrl == other.imageUrl &&
        langKey == other.langKey &&
        lastModifiedBy == other.lastModifiedBy &&
        lastModifiedDate == other.lastModifiedDate &&
        lastName == other.lastName &&
        login == other.login;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, activated.hashCode),
                                                    authorities.hashCode),
                                                createdBy.hashCode),
                                            createdDate.hashCode),
                                        email.hashCode),
                                    firstName.hashCode),
                                id.hashCode),
                            imageUrl.hashCode),
                        langKey.hashCode),
                    lastModifiedBy.hashCode),
                lastModifiedDate.hashCode),
            lastName.hashCode),
        login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdminUserDTO')
          ..add('activated', activated)
          ..add('authorities', authorities)
          ..add('createdBy', createdBy)
          ..add('createdDate', createdDate)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('id', id)
          ..add('imageUrl', imageUrl)
          ..add('langKey', langKey)
          ..add('lastModifiedBy', lastModifiedBy)
          ..add('lastModifiedDate', lastModifiedDate)
          ..add('lastName', lastName)
          ..add('login', login))
        .toString();
  }
}

class AdminUserDTOBuilder
    implements Builder<AdminUserDTO, AdminUserDTOBuilder> {
  _$AdminUserDTO? _$v;

  bool? _activated;

  bool? get activated => _$this._activated;

  set activated(bool? activated) => _$this._activated = activated;

  SetBuilder<String>? _authorities;

  SetBuilder<String> get authorities =>
      _$this._authorities ??= new SetBuilder<String>();

  set authorities(SetBuilder<String>? authorities) =>
      _$this._authorities = authorities;

  String? _createdBy;

  String? get createdBy => _$this._createdBy;

  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  DateTime? _createdDate;

  DateTime? get createdDate => _$this._createdDate;

  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

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

  String? _lastModifiedBy;

  String? get lastModifiedBy => _$this._lastModifiedBy;

  set lastModifiedBy(String? lastModifiedBy) =>
      _$this._lastModifiedBy = lastModifiedBy;

  DateTime? _lastModifiedDate;

  DateTime? get lastModifiedDate => _$this._lastModifiedDate;

  set lastModifiedDate(DateTime? lastModifiedDate) =>
      _$this._lastModifiedDate = lastModifiedDate;

  String? _lastName;

  String? get lastName => _$this._lastName;

  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _login;

  String? get login => _$this._login;

  set login(String? login) => _$this._login = login;

  AdminUserDTOBuilder() {
    AdminUserDTO._initializeBuilder(this);
  }

  AdminUserDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _activated = $v.activated;
      _authorities = $v.authorities?.toBuilder();
      _createdBy = $v.createdBy;
      _createdDate = $v.createdDate;
      _email = $v.email;
      _firstName = $v.firstName;
      _id = $v.id;
      _imageUrl = $v.imageUrl;
      _langKey = $v.langKey;
      _lastModifiedBy = $v.lastModifiedBy;
      _lastModifiedDate = $v.lastModifiedDate;
      _lastName = $v.lastName;
      _login = $v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminUserDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdminUserDTO;
  }

  @override
  void update(void Function(AdminUserDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdminUserDTO build() {
    _$AdminUserDTO _$result;
    try {
      _$result = _$v ??
          new _$AdminUserDTO._(
              activated: activated,
              authorities: _authorities?.build(),
              createdBy: createdBy,
              createdDate: createdDate,
              email: email,
              firstName: firstName,
              id: id,
              imageUrl: imageUrl,
              langKey: langKey,
              lastModifiedBy: lastModifiedBy,
              lastModifiedDate: lastModifiedDate,
              lastName: lastName,
              login: login);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'authorities';
        _authorities?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AdminUserDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
