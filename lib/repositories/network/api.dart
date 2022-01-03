library openapi.api;

import 'package:benzapp_flutter/repositories/network/api/account_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/cittadino_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/delega_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/device_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/fascia_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/gestore_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/marchio_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/notifica_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/public_user_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/rifornimento_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/tessera_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/api/user_jwt_controller_api.dart';
import 'package:benzapp_flutter/repositories/network/api/user_resource_api.dart';
import 'package:benzapp_flutter/repositories/network/auth/api_key_auth.dart';
import 'package:benzapp_flutter/repositories/network/auth/basic_auth.dart';
import 'package:benzapp_flutter/repositories/network/auth/oauth.dart';
import 'package:benzapp_flutter/serializers.dart';
import 'package:built_value/serializer.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'auth/http_auth.dart';

final _defaultInterceptors = [
  PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ),
  OAuthInterceptor(),
  BasicAuthInterceptor(),
  ApiKeyAuthInterceptor(),
  HttpAuthInterceptor()
];

class Openapi {
  late Dio dio;
  late Serializers serializers;
  String basePath = 'http://localhost:8080';

  Openapi(
      {Dio? dio,
      Serializers? serializers,
      String? basePathOverride,
      List<Interceptor>? interceptors}) {
    if (basePathOverride != null) {
      basePath = basePathOverride;
    }
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: basePathOverride ?? basePath,
        connectTimeout: 60000,
        receiveTimeout: 30000,
      );
      this.dio = Dio(options);
    } else {
      this.dio = dio;
    }

    if (interceptors == null) {
      this.dio.interceptors.addAll(_defaultInterceptors);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }

    this.serializers = serializers ?? standardSerializers;
  }

  void setJWTToken(String name, String token) {
    (dio.interceptors
                .firstWhereOrNull((element) => element is HttpAuthInterceptor)
            as HttpAuthInterceptor)
        .tokens[name] = token;
  }

  void setOAuthToken(String name, String token) {
    (dio.interceptors.firstWhereOrNull((element) => element is OAuthInterceptor)
            as OAuthInterceptor)
        .tokens[name] = token;
  }

  void setBasicAuth(String name, String username, String password) {
    var interceptor = (dio.interceptors
            .firstWhereOrNull((element) => element is BasicAuthInterceptor)
        as BasicAuthInterceptor);
    interceptor.authInfo[name] = BasicAuthInfo(username, password);
  }

  void setApiKey(String name, String apiKey) {
    ApiKeyAuthInterceptor? interceptor = (dio.interceptors
            .firstWhereOrNull((element) => element is ApiKeyAuthInterceptor)
        as ApiKeyAuthInterceptor);

    interceptor.apiKeys[name] = apiKey;
  }

  /// Get AccountResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AccountResourceApi getAccountResourceApi() {
    return AccountResourceApi(dio, serializers);
  }

  /// Get CittadinoResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CittadinoResourceApi getCittadinoResourceApi() {
    return CittadinoResourceApi(dio, serializers);
  }

  /// Get DelegaResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DelegaResourceApi getDelegaResourceApi() {
    return DelegaResourceApi(dio, serializers);
  }

  /// Get DeviceResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DeviceResourceApi getDeviceResourceApi() {
    return DeviceResourceApi(dio, serializers);
  }

  /// Get FasciaResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FasciaResourceApi getFasciaResourceApi() {
    return FasciaResourceApi(dio, serializers);
  }

  /// Get GestoreResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GestoreResourceApi getGestoreResourceApi() {
    return GestoreResourceApi(dio, serializers);
  }

  /// Get MarchioResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MarchioResourceApi getMarchioResourceApi() {
    return MarchioResourceApi(dio, serializers);
  }

  /// Get NotificaResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NotificaResourceApi getNotificaResourceApi() {
    return NotificaResourceApi(dio, serializers);
  }

  /// Get PublicUserResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PublicUserResourceApi getPublicUserResourceApi() {
    return PublicUserResourceApi(dio, serializers);
  }

  /// Get RifornimentoResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RifornimentoResourceApi getRifornimentoResourceApi() {
    return RifornimentoResourceApi(dio, serializers);
  }

  /// Get TesseraResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TesseraResourceApi getTesseraResourceApi() {
    return TesseraResourceApi(dio, serializers);
  }

  /// Get UserJwtControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserJwtControllerApi getUserJwtControllerApi() {
    return UserJwtControllerApi(dio, serializers);
  }

  /// Get UserResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserResourceApi getUserResourceApi() {
    return UserResourceApi(dio, serializers);
  }
}
