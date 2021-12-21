import 'package:benzapp_flutter/model/cittadino.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fascia.g.dart';

abstract class Fascia implements Built<Fascia, FasciaBuilder> {
  @BuiltValueField(wireName: r'cittadinos')
  BuiltSet<Cittadino>? get cittadinos;

  @BuiltValueField(wireName: r'descrizione')
  String? get descrizione;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'scontoBenzina')
  double? get scontoBenzina;

  @BuiltValueField(wireName: r'scontoGasolio')
  double? get scontoGasolio;

  // Boilerplate code needed to wire-up generated code
  Fascia._();

  static void _initializeBuilder(FasciaBuilder b) => b;

  factory Fascia([updates(FasciaBuilder b)]) = _$Fascia;

  static Serializer<Fascia> get serializer => _$fasciaSerializer;
}
