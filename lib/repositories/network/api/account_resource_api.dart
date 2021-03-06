import 'dart:async';
import 'dart:convert';

import 'package:benzapp_flutter/repositories/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/network/model/key_and_password_vm.dart';
import 'package:benzapp_flutter/repositories/network/model/managed_user_vm.dart';
import 'package:benzapp_flutter/repositories/network/model/password_change_dto.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

class AccountResourceApi {
  final Dio _dio;
  final Serializers _serializers;

  AccountResourceApi(this._dio, this._serializers);


  /// getAccount
  ///
  ///
  Future<Response<AdminUserDTO>> getAccountUsingGET({
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/account';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((String key, value) => value == null);
    headerParams.removeWhere((String key, value) => value == null);

    final List<String> contentTypes = [];

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: {
          'secure': [
            {
              'type': 'http',
              'name': 'benzapp',
            },
          ],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType: contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((Response response) {
      final Serializer<AdminUserDTO> serializer =
          _serializers.serializerForType(AdminUserDTO) as Serializer<AdminUserDTO>;
      final AdminUserDTO? data = _serializers.deserializeWith<AdminUserDTO>(
          serializer, response.data is String ? jsonDecode(response.data) : response.data);

      return Response<AdminUserDTO>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// isAuthenticated
  ///
  ///
  Future<Response<String>> isAuthenticatedUsingGET({
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/authenticate';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((String key, dynamic value) => value == null);
    headerParams.removeWhere((String key, dynamic value) => value == null);

    final List<String> contentTypes = [];

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: {
          'secure': [
            {
              'type': 'http',
              'name': 'benzapp',
            },
          ],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType: contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((Response response) {
      final String data = response.data as String;

      return Response<String>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }
}
