// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Device> _$deviceSerializer = new _$DeviceSerializer();

class _$DeviceSerializer implements StructuredSerializer<Device> {
  @override
  final Iterable<Type> types = const [Device, _$Device];
  @override
  final String wireName = 'Device';

  @override
  Iterable<Object?> serialize(Serializers serializers, Device object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.deviceId;
    if (value != null) {
      result
        ..add('deviceId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Device deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'deviceId':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Device extends Device {
  @override
  final String? deviceId;
  @override
  final int? id;
  @override
  final String? owner;

  factory _$Device([void Function(DeviceBuilder)? updates]) =>
      (new DeviceBuilder()..update(updates)).build();

  _$Device._({this.deviceId, this.id, this.owner}) : super._();

  @override
  Device rebuild(void Function(DeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceBuilder toBuilder() => new DeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Device &&
        deviceId == other.deviceId &&
        id == other.id &&
        owner == other.owner;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, deviceId.hashCode), id.hashCode), owner.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Device')
          ..add('deviceId', deviceId)
          ..add('id', id)
          ..add('owner', owner))
        .toString();
  }
}

class DeviceBuilder implements Builder<Device, DeviceBuilder> {
  _$Device? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  DeviceBuilder() {
    Device._initializeBuilder(this);
  }

  DeviceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _id = $v.id;
      _owner = $v.owner;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Device other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Device;
  }

  @override
  void update(void Function(DeviceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Device build() {
    final _$result =
        _$v ?? new _$Device._(deviceId: deviceId, id: id, owner: owner);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
