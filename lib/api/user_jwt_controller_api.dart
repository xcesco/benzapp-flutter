import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';

import 'package:benzapp_flutter/model/jwt_token.dart';
import 'package:benzapp_flutter/model/login_vm.dart';

class UserJwtControllerApi {
    final Dio _dio;
    final Serializers _serializers;

    UserJwtControllerApi(this._dio, this._serializers);

    /// authorize
    ///
    /// 
    Future<Response<JWTToken>> authorizeUsingPOST({ 
        LoginVM? loginVM,
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

        queryParams.removeWhere((key, value) => value == null);
        headerParams.removeWhere((key, value) => value == null);

        final List<String> contentTypes = [
            'application/json',
        ];

        final serializedBody = _serializers.serialize(loginVM);
        final jsonloginVM = json.encode(serializedBody);
        bodyData = jsonloginVM;

        return _dio.request(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'post'.toUpperCase(),
                headers: headerParams,
                extra: {
                    'secure': [],
                    if (extra != null) ...extra,
                },
                validateStatus: validateStatus,
                contentType: contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
            ),
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
        ).then((response) {
            final serializer = _serializers.serializerForType(JWTToken) as Serializer<JWTToken>;
            final data = _serializers.deserializeWith<JWTToken>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<JWTToken>(
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
