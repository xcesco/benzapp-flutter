import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_dto.g.dart';

abstract class UserDTO implements Built<UserDTO, UserDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'login')
  String? get login;

  // Boilerplate code needed to wire-up generated code
  UserDTO._();

  static void _initializeBuilder(UserDTOBuilder b) => b;

  factory UserDTO([updates(UserDTOBuilder b)]) = _$UserDTO;

  static Serializer<UserDTO> get serializer => _$userDTOSerializer;
}
