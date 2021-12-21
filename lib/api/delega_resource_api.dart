import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';

import 'package:benzapp_flutter/model/delega.dart';
import 'package:built_collection/built_collection.dart';

class DelegaResourceApi {
    final Dio _dio;
    final Serializers _serializers;

    DelegaResourceApi(this._dio, this._serializers);

    /// countDelegas
    ///
    /// 
    Future<Response<int>> countDelegasUsingGET({ 
        int? cittadinoIdPeriodEquals,
        int? cittadinoIdPeriodGreaterThan,
        int? cittadinoIdPeriodGreaterThanOrEqual,
        BuiltList<int>? cittadinoIdPeriodIn,
        int? cittadinoIdPeriodLessThan,
        int? cittadinoIdPeriodLessThanOrEqual,
        int? cittadinoIdPeriodNotEquals,
        BuiltList<int>? cittadinoIdPeriodNotIn,
        bool? cittadinoIdPeriodSpecified,
        int? idPeriodEquals,
        int? idPeriodGreaterThan,
        int? idPeriodGreaterThanOrEqual,
        BuiltList<int>? idPeriodIn,
        int? idPeriodLessThan,
        int? idPeriodLessThanOrEqual,
        int? idPeriodNotEquals,
        BuiltList<int>? idPeriodNotIn,
        bool? idPeriodSpecified,
        int? tesseraIdPeriodEquals,
        int? tesseraIdPeriodGreaterThan,
        int? tesseraIdPeriodGreaterThanOrEqual,
        BuiltList<int>? tesseraIdPeriodIn,
        int? tesseraIdPeriodLessThan,
        int? tesseraIdPeriodLessThanOrEqual,
        int? tesseraIdPeriodNotEquals,
        BuiltList<int>? tesseraIdPeriodNotIn,
        bool? tesseraIdPeriodSpecified,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/delegas/count';

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams[r'cittadinoId.equals'] = cittadinoIdPeriodEquals;
        queryParams[r'cittadinoId.greaterThan'] = cittadinoIdPeriodGreaterThan;
        queryParams[r'cittadinoId.greaterThanOrEqual'] = cittadinoIdPeriodGreaterThanOrEqual;
        queryParams[r'cittadinoId.in'] = cittadinoIdPeriodIn;
        queryParams[r'cittadinoId.lessThan'] = cittadinoIdPeriodLessThan;
        queryParams[r'cittadinoId.lessThanOrEqual'] = cittadinoIdPeriodLessThanOrEqual;
        queryParams[r'cittadinoId.notEquals'] = cittadinoIdPeriodNotEquals;
        queryParams[r'cittadinoId.notIn'] = cittadinoIdPeriodNotIn;
        queryParams[r'cittadinoId.specified'] = cittadinoIdPeriodSpecified;
        queryParams[r'id.equals'] = idPeriodEquals;
        queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
        queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
        queryParams[r'id.in'] = idPeriodIn;
        queryParams[r'id.lessThan'] = idPeriodLessThan;
        queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
        queryParams[r'id.notEquals'] = idPeriodNotEquals;
        queryParams[r'id.notIn'] = idPeriodNotIn;
        queryParams[r'id.specified'] = idPeriodSpecified;
        queryParams[r'tesseraId.equals'] = tesseraIdPeriodEquals;
        queryParams[r'tesseraId.greaterThan'] = tesseraIdPeriodGreaterThan;
        queryParams[r'tesseraId.greaterThanOrEqual'] = tesseraIdPeriodGreaterThanOrEqual;
        queryParams[r'tesseraId.in'] = tesseraIdPeriodIn;
        queryParams[r'tesseraId.lessThan'] = tesseraIdPeriodLessThan;
        queryParams[r'tesseraId.lessThanOrEqual'] = tesseraIdPeriodLessThanOrEqual;
        queryParams[r'tesseraId.notEquals'] = tesseraIdPeriodNotEquals;
        queryParams[r'tesseraId.notIn'] = tesseraIdPeriodNotIn;
        queryParams[r'tesseraId.specified'] = tesseraIdPeriodSpecified;
        queryParams.removeWhere((key, value) => value == null);
        headerParams.removeWhere((key, value) => value == null);

        final List<String> contentTypes = [];

        return _dio.request(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'get'.toUpperCase(),
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
            final data = response.data as int;

            return Response<int>(
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

    /// createDelega
    ///
    /// 
    Future<Response<Delega>> createDelegaUsingPOST({ 
        Delega? delega,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/delegas';

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

        final serializedBody = _serializers.serialize(delega);
        final jsondelega = json.encode(serializedBody);
        bodyData = jsondelega;

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
            final serializer = _serializers.serializerForType(Delega) as Serializer<Delega>;
            final data = _serializers.deserializeWith<Delega>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Delega>(
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

    /// deleteDelega
    ///
    /// 
    Future<Response<void>> deleteDelegaUsingDELETE(
        int id, { 
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        final String _path = '/api/delegas/{id}'.replaceAll('{' r'id' '}', id.toString());

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams.removeWhere((key, value) => value == null);
        headerParams.removeWhere((key, value) => value == null);

        final List<String> contentTypes = [];

        return _dio.request(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'delete'.toUpperCase(),
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
        );
    }

    /// getAllDelegas
    ///
    /// 
    Future<Response<BuiltList<Delega>>> getAllDelegasUsingGET({ 
        int? cittadinoIdPeriodEquals,
        int? cittadinoIdPeriodGreaterThan,
        int? cittadinoIdPeriodGreaterThanOrEqual,
        BuiltList<int>? cittadinoIdPeriodIn,
        int? cittadinoIdPeriodLessThan,
        int? cittadinoIdPeriodLessThanOrEqual,
        int? cittadinoIdPeriodNotEquals,
        BuiltList<int>? cittadinoIdPeriodNotIn,
        bool? cittadinoIdPeriodSpecified,
        int? idPeriodEquals,
        int? idPeriodGreaterThan,
        int? idPeriodGreaterThanOrEqual,
        BuiltList<int>? idPeriodIn,
        int? idPeriodLessThan,
        int? idPeriodLessThanOrEqual,
        int? idPeriodNotEquals,
        BuiltList<int>? idPeriodNotIn,
        bool? idPeriodSpecified,
        int? page,
        int? size,
        BuiltList<String>? sort,
        int? tesseraIdPeriodEquals,
        int? tesseraIdPeriodGreaterThan,
        int? tesseraIdPeriodGreaterThanOrEqual,
        BuiltList<int>? tesseraIdPeriodIn,
        int? tesseraIdPeriodLessThan,
        int? tesseraIdPeriodLessThanOrEqual,
        int? tesseraIdPeriodNotEquals,
        BuiltList<int>? tesseraIdPeriodNotIn,
        bool? tesseraIdPeriodSpecified,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/delegas';

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams[r'cittadinoId.equals'] = cittadinoIdPeriodEquals;
        queryParams[r'cittadinoId.greaterThan'] = cittadinoIdPeriodGreaterThan;
        queryParams[r'cittadinoId.greaterThanOrEqual'] = cittadinoIdPeriodGreaterThanOrEqual;
        queryParams[r'cittadinoId.in'] = cittadinoIdPeriodIn;
        queryParams[r'cittadinoId.lessThan'] = cittadinoIdPeriodLessThan;
        queryParams[r'cittadinoId.lessThanOrEqual'] = cittadinoIdPeriodLessThanOrEqual;
        queryParams[r'cittadinoId.notEquals'] = cittadinoIdPeriodNotEquals;
        queryParams[r'cittadinoId.notIn'] = cittadinoIdPeriodNotIn;
        queryParams[r'cittadinoId.specified'] = cittadinoIdPeriodSpecified;
        queryParams[r'id.equals'] = idPeriodEquals;
        queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
        queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
        queryParams[r'id.in'] = idPeriodIn;
        queryParams[r'id.lessThan'] = idPeriodLessThan;
        queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
        queryParams[r'id.notEquals'] = idPeriodNotEquals;
        queryParams[r'id.notIn'] = idPeriodNotIn;
        queryParams[r'id.specified'] = idPeriodSpecified;
        queryParams[r'page'] = page;
        queryParams[r'size'] = size;
        queryParams[r'sort'] = sort;
        queryParams[r'tesseraId.equals'] = tesseraIdPeriodEquals;
        queryParams[r'tesseraId.greaterThan'] = tesseraIdPeriodGreaterThan;
        queryParams[r'tesseraId.greaterThanOrEqual'] = tesseraIdPeriodGreaterThanOrEqual;
        queryParams[r'tesseraId.in'] = tesseraIdPeriodIn;
        queryParams[r'tesseraId.lessThan'] = tesseraIdPeriodLessThan;
        queryParams[r'tesseraId.lessThanOrEqual'] = tesseraIdPeriodLessThanOrEqual;
        queryParams[r'tesseraId.notEquals'] = tesseraIdPeriodNotEquals;
        queryParams[r'tesseraId.notIn'] = tesseraIdPeriodNotIn;
        queryParams[r'tesseraId.specified'] = tesseraIdPeriodSpecified;
        queryParams.removeWhere((key, value) => value == null);
        headerParams.removeWhere((key, value) => value == null);

        final List<String> contentTypes = [];

        return _dio.request(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'get'.toUpperCase(),
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
            const collectionType = BuiltList;
            const type = FullType(collectionType, [FullType(Delega)]);
            final BuiltList<Delega> data = _serializers.deserialize(response.data is String ? jsonDecode(response.data) : response.data, specifiedType: type) as BuiltList<Delega>;

            return Response<BuiltList<Delega>>(
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

    /// getDelega
    ///
    /// 
    Future<Response<Delega>> getDelegaUsingGET(
        int id, { 
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        final String _path = '/api/delegas/{id}'.replaceAll('{' r'id' '}', id.toString());

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams.removeWhere((key, value) => value == null);
        headerParams.removeWhere((key, value) => value == null);

        final List<String> contentTypes = [];

        return _dio.request(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'get'.toUpperCase(),
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
            final serializer = _serializers.serializerForType(Delega) as Serializer<Delega>;
            final data = _serializers.deserializeWith<Delega>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Delega>(
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

    /// partialUpdateDelega
    ///
    /// 
    Future<Response<Delega>> partialUpdateDelegaUsingPATCH({ 
        Delega? delega,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/delegas';

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams.removeWhere((key, value) => value == null);
        headerParams.removeWhere((key, value) => value == null);

        final List<String> contentTypes = [
            'application/json',
            'application/merge-patch+json',
        ];

        final serializedBody = _serializers.serialize(delega);
        final jsondelega = json.encode(serializedBody);
        bodyData = jsondelega;

        return _dio.request(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'patch'.toUpperCase(),
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
            final serializer = _serializers.serializerForType(Delega) as Serializer<Delega>;
            final data = _serializers.deserializeWith<Delega>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Delega>(
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

    /// updateDelega
    ///
    /// 
    Future<Response<Delega>> updateDelegaUsingPUT({ 
        Delega? delega,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/delegas';

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

        final serializedBody = _serializers.serialize(delega);
        final jsondelega = json.encode(serializedBody);
        bodyData = jsondelega;

        return _dio.request(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'put'.toUpperCase(),
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
            final serializer = _serializers.serializerForType(Delega) as Serializer<Delega>;
            final data = _serializers.deserializeWith<Delega>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Delega>(
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
