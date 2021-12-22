import 'package:benzapp_flutter/network/model/tessera.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'cittadino.dart';

part 'delega.g.dart';

abstract class Delega implements Built<Delega, DelegaBuilder> {
  @BuiltValueField(wireName: r'cittadino')
  Cittadino? get cittadino;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'tessera')
  Tessera? get tessera;

  // Boilerplate code needed to wire-up generated code
  Delega._();

  static void _initializeBuilder(DelegaBuilder b) => b;

  factory Delega([updates(DelegaBuilder b)]) = _$Delega;

  static Serializer<Delega> get serializer => _$delegaSerializer;
}
