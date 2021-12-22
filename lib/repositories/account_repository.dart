import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/network/model/jwt_token.dart';
import 'package:tuple/tuple.dart';

abstract class AccountRepository {
  Future<AdminUserDTO?> getAccount();

  Future<JWTToken?> getJWTToken();

  bool hasValidAccount();

  Future<Tuple2<AdminUserDTO?, LoginStatus>> login(
      String username, String password);

  bool logout();

  String updateClientJWTToken(JWTToken jwtToken);
}
