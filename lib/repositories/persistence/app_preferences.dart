import 'dart:convert';

import 'package:benzapp_flutter/repositories/network/model/admin_user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../serializers.dart';

class AppPreferences {
  AppPreferences._privateConstructor();

  static final AppPreferences _instance = AppPreferences._privateConstructor();

  static AppPreferences get instance => _instance;

  Future<void> setJWToken(String token) async {
    (await SharedPreferences.getInstance()).setString("JWTToken", token);
  }

  Future<String?> getJWToken() async {
    return (await SharedPreferences.getInstance()).getString("JWTToken");
  }

  Future<void> setAccount(AdminUserDTO account) async {
    final String jsonValue =
        standardSerializers.toJson(AdminUserDTO.serializer, account);
    (await SharedPreferences.getInstance())
        .setString("AdminUserDTO", base64.encode(utf8.encode(jsonValue)));
  }

  Future<AdminUserDTO?> getAccount() async {
    final String jsonValue =
        (await SharedPreferences.getInstance()).getString("AdminUserDTO") ?? '';

    if (jsonValue.isEmpty) {
      return null;
    } else {
      return standardSerializers.fromJson(
          AdminUserDTO.serializer, utf8.decode(base64.decode(jsonValue)));
    }
  }

  Future<bool> isPrimoAccesso() async {
    return (await SharedPreferences.getInstance()).getBool("PrimoAccesso") ??
        true;
  }

  Future<void> setPrimoAccesso(bool value) async {
    (await SharedPreferences.getInstance()).setBool("PrimoAccesso", value);
  }

  Future<void> removeAccount() async {
    (await SharedPreferences.getInstance()).remove("AdminUserDTO");
  }
}
