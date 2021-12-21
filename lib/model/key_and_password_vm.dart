import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'key_and_password_vm.g.dart';

abstract class KeyAndPasswordVM
    implements Built<KeyAndPasswordVM, KeyAndPasswordVMBuilder> {
  @BuiltValueField(wireName: r'key')
  String? get key;

  @BuiltValueField(wireName: r'newPassword')
  String? get newPassword;

  // Boilerplate code needed to wire-up generated code
  KeyAndPasswordVM._();

  static void _initializeBuilder(KeyAndPasswordVMBuilder b) => b;

  factory KeyAndPasswordVM([updates(KeyAndPasswordVMBuilder b)]) =
      _$KeyAndPasswordVM;

  static Serializer<KeyAndPasswordVM> get serializer =>
      _$keyAndPasswordVMSerializer;
}
