import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'managed_user_vm.g.dart';

abstract class ManagedUserVM implements Built<ManagedUserVM, ManagedUserVMBuilder> {

    @BuiltValueField(wireName: r'activated')
    bool? get activated;

    @BuiltValueField(wireName: r'authorities')
    BuiltSet<String>? get authorities;

    @BuiltValueField(wireName: r'createdBy')
    String? get createdBy;

    @BuiltValueField(wireName: r'createdDate')
    DateTime? get createdDate;

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

    @BuiltValueField(wireName: r'lastModifiedBy')
    String? get lastModifiedBy;

    @BuiltValueField(wireName: r'lastModifiedDate')
    DateTime? get lastModifiedDate;

    @BuiltValueField(wireName: r'lastName')
    String? get lastName;

    @BuiltValueField(wireName: r'login')
    String? get login;

    @BuiltValueField(wireName: r'password')
    String? get password;

    // Boilerplate code needed to wire-up generated code
    ManagedUserVM._();

    static void _initializeBuilder(ManagedUserVMBuilder b) => b;

    factory ManagedUserVM([updates(ManagedUserVMBuilder b)]) = _$ManagedUserVM;
    static Serializer<ManagedUserVM> get serializer => _$managedUserVMSerializer;
}

