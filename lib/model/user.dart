import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {

    @BuiltValueField(wireName: r'activated')
    bool? get activated;

    @BuiltValueField(wireName: r'email')
    String? get email;

    @BuiltValueField(wireName: r'firstName')
    String? get firstName;

    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'imageUrl')
    String? get imageUrl;

    @BuiltValueField(wireName: r'langKey')
    String? get langKey;

    @BuiltValueField(wireName: r'lastName')
    String? get lastName;

    @BuiltValueField(wireName: r'login')
    String? get login;

    @BuiltValueField(wireName: r'resetDate')
    DateTime? get resetDate;

    // Boilerplate code needed to wire-up generated code
    User._();

    static void _initializeBuilder(UserBuilder b) => b;

    factory User([updates(UserBuilder b)]) = _$User;
    static Serializer<User> get serializer => _$userSerializer;
}

