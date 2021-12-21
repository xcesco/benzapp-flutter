import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_vm.g.dart';

abstract class LoginVM implements Built<LoginVM, LoginVMBuilder> {
  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'rememberMe')
  bool? get rememberMe;

  @BuiltValueField(wireName: r'username')
  String? get username;

  // Boilerplate code needed to wire-up generated code
  LoginVM._();

  static void _initializeBuilder(LoginVMBuilder b) => b;

  factory LoginVM([updates(LoginVMBuilder b)]) = _$LoginVM;

  static Serializer<LoginVM> get serializer => _$loginVMSerializer;
}
