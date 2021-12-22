import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'jwt_token.g.dart';

abstract class JWTToken implements Built<JWTToken, JWTTokenBuilder> {
  @BuiltValueField(wireName: r'id_token')
  String? get idToken;

  // Boilerplate code needed to wire-up generated code
  JWTToken._();

  static void _initializeBuilder(JWTTokenBuilder b) => b;

  factory JWTToken([updates(JWTTokenBuilder b)]) = _$JWTToken;

  static Serializer<JWTToken> get serializer => _$jWTTokenSerializer;
}
