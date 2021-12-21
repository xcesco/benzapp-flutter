import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device.g.dart';

abstract class Device implements Built<Device, DeviceBuilder> {
  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'owner')
  String? get owner;

  // Boilerplate code needed to wire-up generated code
  Device._();

  static void _initializeBuilder(DeviceBuilder b) => b;

  factory Device([updates(DeviceBuilder b)]) = _$Device;

  static Serializer<Device> get serializer => _$deviceSerializer;
}
