import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notifica_dto.g.dart';

abstract class NotificaDTO implements Built<NotificaDTO, NotificaDTOBuilder> {

    @BuiltValueField(wireName: r'data')
    DateTime? get data;

    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'targa')
    String? get targa;

    // Boilerplate code needed to wire-up generated code
    NotificaDTO._();

    static void _initializeBuilder(NotificaDTOBuilder b) => b;

    factory NotificaDTO([updates(NotificaDTOBuilder b)]) = _$NotificaDTO;
    static Serializer<NotificaDTO> get serializer => _$notificaDTOSerializer;
}

