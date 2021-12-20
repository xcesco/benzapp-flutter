// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JWTToken> _$jWTTokenSerializer = new _$JWTTokenSerializer();

class _$JWTTokenSerializer implements StructuredSerializer<JWTToken> {
  @override
  final Iterable<Type> types = const [JWTToken, _$JWTToken];
  @override
  final String wireName = 'JWTToken';

  @override
  Iterable<Object?> serialize(Serializers serializers, JWTToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.idToken;
    if (value != null) {
      result
        ..add('id_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  JWTToken deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JWTTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id_token':
          result.idToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$JWTToken extends JWTToken {
  @override
  final String? idToken;

  factory _$JWTToken([void Function(JWTTokenBuilder)? updates]) =>
      (new JWTTokenBuilder()..update(updates)).build();

  _$JWTToken._({this.idToken}) : super._();

  @override
  JWTToken rebuild(void Function(JWTTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JWTTokenBuilder toBuilder() => new JWTTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JWTToken && idToken == other.idToken;
  }

  @override
  int get hashCode {
    return $jf($jc(0, idToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('JWTToken')..add('idToken', idToken))
        .toString();
  }
}

class JWTTokenBuilder implements Builder<JWTToken, JWTTokenBuilder> {
  _$JWTToken? _$v;

  String? _idToken;
  String? get idToken => _$this._idToken;
  set idToken(String? idToken) => _$this._idToken = idToken;

  JWTTokenBuilder() {
    JWTToken._initializeBuilder(this);
  }

  JWTTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idToken = $v.idToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JWTToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JWTToken;
  }

  @override
  void update(void Function(JWTTokenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$JWTToken build() {
    final _$result = _$v ?? new _$JWTToken._(idToken: idToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
