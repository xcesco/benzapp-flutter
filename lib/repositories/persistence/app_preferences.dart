import 'package:benzapp_flutter/network/model/admin_user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../serializers.dart';

class AppPreferences {
  AppPreferences._privateConstructor();

  static final AppPreferences _instance = AppPreferences._privateConstructor();

  static AppPreferences get instance => _instance;

  Future<void> setJWToken(String token) async {
    (await SharedPreferences.getInstance()).setString("JWTToken", token);
  }

  Future<void> setAccount(AdminUserDTO account) async {
    (await SharedPreferences.getInstance()).setString("AdminUserDTO",
        standardSerializers.toJson(AdminUserDTO.serializer, account));
  }
}
