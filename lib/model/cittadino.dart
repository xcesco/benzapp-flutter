import 'package:built_collection/built_collection.dart';
import 'package:api/model/fascia.dart';
import 'package:api/model/delega.dart';
import 'package:api/model/tessera.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cittadino.g.dart';

abstract class Cittadino implements Built<Cittadino, CittadinoBuilder> {

    @BuiltValueField(wireName: r'codiceFiscale')
    String? get codiceFiscale;

    @BuiltValueField(wireName: r'cognome')
    String? get cognome;

    @BuiltValueField(wireName: r'delegas')
    BuiltSet<Delega>? get delegas;

    @BuiltValueField(wireName: r'fascia')
    Fascia? get fascia;

    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'nome')
    String? get nome;

    @BuiltValueField(wireName: r'owner')
    String? get owner;

    @BuiltValueField(wireName: r'tesseras')
    BuiltSet<Tessera>? get tesseras;

    // Boilerplate code needed to wire-up generated code
    Cittadino._();

    static void _initializeBuilder(CittadinoBuilder b) => b;

    factory Cittadino([updates(CittadinoBuilder b)]) = _$Cittadino;
    static Serializer<Cittadino> get serializer => _$cittadinoSerializer;
}

