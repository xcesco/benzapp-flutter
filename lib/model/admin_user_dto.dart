import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_user_dto.g.dart';

abstract class AdminUserDTO
    implements Built<AdminUserDTO, AdminUserDTOBuilder> {
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

  // Boilerplate code needed to wire-up generated code
  AdminUserDTO._();

  static void _initializeBuilder(AdminUserDTOBuilder b) => b;

  factory AdminUserDTO([updates(AdminUserDTOBuilder b)]) = _$AdminUserDTO;

  static Serializer<AdminUserDTO> get serializer => _$adminUserDTOSerializer;
}
