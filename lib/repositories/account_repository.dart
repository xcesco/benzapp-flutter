import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/network/model/jwt_token.dart';
import 'package:tuple/tuple.dart';

abstract class AccountRepository {
  Future<AdminUserDTO?> getAccount();

  String get backendBaseUrl;

  Future<String?> getJWTToken();

  Future<bool> hasValidAccount();

  Future<Tuple2<AdminUserDTO?, LoginStatus>> login(
      String username, String password);

  Future<void> logout();

  Future<String> refreshRemoteConfig();

  String updateClientJWTToken(JWTToken jwtToken);

  void updateBaseUrl(String baseUrl);
}
