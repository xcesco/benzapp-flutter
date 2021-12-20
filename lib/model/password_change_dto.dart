import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_change_dto.g.dart';

abstract class PasswordChangeDTO implements Built<PasswordChangeDTO, PasswordChangeDTOBuilder> {

    @BuiltValueField(wireName: r'currentPassword')
    String? get currentPassword;

    @BuiltValueField(wireName: r'newPassword')
    String? get newPassword;

    // Boilerplate code needed to wire-up generated code
    PasswordChangeDTO._();

    static void _initializeBuilder(PasswordChangeDTOBuilder b) => b;

    factory PasswordChangeDTO([updates(PasswordChangeDTOBuilder b)]) = _$PasswordChangeDTO;
    static Serializer<PasswordChangeDTO> get serializer => _$passwordChangeDTOSerializer;
}

