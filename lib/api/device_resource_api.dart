import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';

import 'package:api/model/device.dart';
import 'package:built_collection/built_collection.dart';

class DeviceResourceApi {
    final Dio _dio;
    Serializers _serializers;

    DeviceResourceApi(this._dio, this._serializers);

    /// countDevices
    ///
    /// 
    Future<Response<int>> countDevicesUsingGET({ 
        String? deviceIdPeriodContains,
        String? deviceIdPeriodDoesNotContain,
        String? deviceIdPeriodEquals,
        BuiltList<String>? deviceIdPeriodIn,
        String? deviceIdPeriodNotEquals,
        BuiltList<String>? deviceIdPeriodNotIn,
        bool? deviceIdPeriodSpecified,
        int? idPeriodEquals,
        int? idPeriodGreaterThan,
        int? idPeriodGreaterThanOrEqual,
        BuiltList<int>? idPeriodIn,
        int? idPeriodLessThan,
        int? idPeriodLessThanOrEqual,
        int? idPeriodNotEquals,
        BuiltList<int>? idPeriodNotIn,
        bool? idPeriodSpecified,
        String? ownerPeriodContains,
        String? ownerPeriodDoesNotContain,
        String? ownerPeriodEquals,
        BuiltList<String>? ownerPeriodIn,
        String? ownerPeriodNotEquals,
        BuiltList<String>? ownerPeriodNotIn,
        bool? ownerPeriodSpecified,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/devices/count';

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams[r'deviceId.contains'] = deviceIdPeriodContains;
        queryParams[r'deviceId.doesNotContain'] = deviceIdPeriodDoesNotContain;
        queryParams[r'deviceId.equals'] = deviceIdPeriodEquals;
        queryParams[r'deviceId.in'] = deviceIdPeriodIn;
        queryParams[r'deviceId.notEquals'] = deviceIdPeriodNotEquals;
        queryParams[r'deviceId.notIn'] = deviceIdPeriodNotIn;
        queryParams[r'deviceId.specified'] = deviceIdPeriodSpecified;
        queryParams[r'id.equals'] = idPeriodEquals;
        queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
        queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
        queryParams[r'id.in'] = idPeriodIn;
        queryParams[r'id.lessThan'] = idPeriodLessThan;
        queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
        queryParams[r'id.notEquals'] = idPeriodNotEquals;
        queryParams[r'id.notIn'] = idPeriodNotIn;
        queryParams[r'id.specified'] = idPeriodSpecified;
        queryParams[r'owner.contains'] = ownerPeriodContains;
        queryParams[r'owner.doesNotContain'] = ownerPeriodDoesNotContain;
        queryParams[r'owner.equals'] = ownerPeriodEquals;
        queryParams[r'owner.in'] = ownerPeriodIn;
        queryParams[r'owner.notEquals'] = ownerPeriodNotEquals;
        queryParams[r'owner.notIn'] = ownerPeriodNotIn;
        queryParams[r'owner.specified'] = ownerPeriodSpecified;
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

    /// createDevice
    ///
    /// 
    Future<Response<Device>> createDeviceUsingPOST({ 
        Device? device,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/devices';

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

        final serializedBody = _serializers.serialize(device);
        final jsondevice = json.encode(serializedBody);
        bodyData = jsondevice;

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
            final serializer = _serializers.serializerForType(Device) as Serializer<Device>;
            final data = _serializers.deserializeWith<Device>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Device>(
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

    /// deleteDevice
    ///
    /// 
    Future<Response<void>> deleteDeviceUsingDELETE(
        int id, { 
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        final String _path = '/api/devices/{id}'.replaceAll('{' r'id' '}', id.toString());

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

    /// getAllDevices
    ///
    /// 
    Future<Response<BuiltList<Device>>> getAllDevicesUsingGET({ 
        String? deviceIdPeriodContains,
        String? deviceIdPeriodDoesNotContain,
        String? deviceIdPeriodEquals,
        BuiltList<String>? deviceIdPeriodIn,
        String? deviceIdPeriodNotEquals,
        BuiltList<String>? deviceIdPeriodNotIn,
        bool? deviceIdPeriodSpecified,
        int? idPeriodEquals,
        int? idPeriodGreaterThan,
        int? idPeriodGreaterThanOrEqual,
        BuiltList<int>? idPeriodIn,
        int? idPeriodLessThan,
        int? idPeriodLessThanOrEqual,
        int? idPeriodNotEquals,
        BuiltList<int>? idPeriodNotIn,
        bool? idPeriodSpecified,
        String? ownerPeriodContains,
        String? ownerPeriodDoesNotContain,
        String? ownerPeriodEquals,
        BuiltList<String>? ownerPeriodIn,
        String? ownerPeriodNotEquals,
        BuiltList<String>? ownerPeriodNotIn,
        bool? ownerPeriodSpecified,
        int? page,
        int? size,
        BuiltList<String>? sort,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/devices';

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams[r'deviceId.contains'] = deviceIdPeriodContains;
        queryParams[r'deviceId.doesNotContain'] = deviceIdPeriodDoesNotContain;
        queryParams[r'deviceId.equals'] = deviceIdPeriodEquals;
        queryParams[r'deviceId.in'] = deviceIdPeriodIn;
        queryParams[r'deviceId.notEquals'] = deviceIdPeriodNotEquals;
        queryParams[r'deviceId.notIn'] = deviceIdPeriodNotIn;
        queryParams[r'deviceId.specified'] = deviceIdPeriodSpecified;
        queryParams[r'id.equals'] = idPeriodEquals;
        queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
        queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
        queryParams[r'id.in'] = idPeriodIn;
        queryParams[r'id.lessThan'] = idPeriodLessThan;
        queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
        queryParams[r'id.notEquals'] = idPeriodNotEquals;
        queryParams[r'id.notIn'] = idPeriodNotIn;
        queryParams[r'id.specified'] = idPeriodSpecified;
        queryParams[r'owner.contains'] = ownerPeriodContains;
        queryParams[r'owner.doesNotContain'] = ownerPeriodDoesNotContain;
        queryParams[r'owner.equals'] = ownerPeriodEquals;
        queryParams[r'owner.in'] = ownerPeriodIn;
        queryParams[r'owner.notEquals'] = ownerPeriodNotEquals;
        queryParams[r'owner.notIn'] = ownerPeriodNotIn;
        queryParams[r'owner.specified'] = ownerPeriodSpecified;
        queryParams[r'page'] = page;
        queryParams[r'size'] = size;
        queryParams[r'sort'] = sort;
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
            const type = FullType(collectionType, [FullType(Device)]);
            final BuiltList<Device> data = _serializers.deserialize(response.data is String ? jsonDecode(response.data) : response.data, specifiedType: type) as BuiltList<Device>;

            return Response<BuiltList<Device>>(
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

    /// getDevice
    ///
    /// 
    Future<Response<Device>> getDeviceUsingGET(
        int id, { 
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        final String _path = '/api/devices/{id}'.replaceAll('{' r'id' '}', id.toString());

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
            final serializer = _serializers.serializerForType(Device) as Serializer<Device>;
            final data = _serializers.deserializeWith<Device>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Device>(
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

    /// partialUpdateDevice
    ///
    /// 
    Future<Response<Device>> partialUpdateDeviceUsingPATCH({ 
        Device? device,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/devices';

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

        final serializedBody = _serializers.serialize(device);
        final jsondevice = json.encode(serializedBody);
        bodyData = jsondevice;

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
            final serializer = _serializers.serializerForType(Device) as Serializer<Device>;
            final data = _serializers.deserializeWith<Device>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Device>(
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

    /// updateDevice
    ///
    /// 
    Future<Response<Device>> updateDeviceUsingPUT({
        Device? device,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/devices';

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

        final serializedBody = _serializers.serialize(device);
        final jsondevice = json.encode(serializedBody);
        bodyData = jsondevice;

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
            final serializer = _serializers.serializerForType(Device) as Serializer<Device>;
            final data = _serializers.deserializeWith<Device>(serializer, response.data is String ? jsonDecode(response.data) : response.data);

            return Response<Device>(
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
