import 'package:benzapp_flutter/model/gestore.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'marchio.g.dart';

abstract class Marchio implements Built<Marchio, MarchioBuilder> {
  @BuiltValueField(wireName: r'gestores')
  BuiltSet<Gestore>? get gestores;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'immagine')
  String? get immagine;

  @BuiltValueField(wireName: r'immagineContentType')
  String? get immagineContentType;

  @BuiltValueField(wireName: r'nome')
  String? get nome;

  // Boilerplate code needed to wire-up generated code
  Marchio._();

  static void _initializeBuilder(MarchioBuilder b) => b;

  factory Marchio([updates(MarchioBuilder b)]) = _$Marchio;

  static Serializer<Marchio> get serializer => _$marchioSerializer;
}
