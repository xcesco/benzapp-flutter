import 'dart:async';
import 'dart:convert';

import 'package:benzapp_flutter/model/fascia.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

class FasciaResourceApi {
  final Dio _dio;
  final Serializers _serializers;

  FasciaResourceApi(this._dio, this._serializers);

  /// createFascia
  ///
  ///
  Future<Response<Fascia>> createFasciaUsingPOST({
    Fascia? fascia,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/fascias';

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

    final serializedBody = _serializers.serialize(fascia);
    final jsonfascia = json.encode(serializedBody);
    bodyData = jsonfascia;

    return _dio
        .request(
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
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer =
          _serializers.serializerForType(Fascia) as Serializer<Fascia>;
      final data = _serializers.deserializeWith<Fascia>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Fascia>(
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

  /// deleteFascia
  ///
  ///
  Future<Response<void>> deleteFasciaUsingDELETE(
    int id, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String _path =
        '/api/fascias/{id}'.replaceAll('{' r'id' '}', id.toString());

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
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// getAllFascias
  ///
  ///
  Future<Response<BuiltList<Fascia>>> getAllFasciasUsingGET({
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/fascias';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

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
          'secure': [],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      const collectionType = BuiltList;
      const type = FullType(collectionType, [FullType(Fascia)]);
      final BuiltList<Fascia> data = _serializers.deserialize(
          response.data is String ? jsonDecode(response.data) : response.data,
          specifiedType: type) as BuiltList<Fascia>;

      return Response<BuiltList<Fascia>>(
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

  /// getFascia
  ///
  ///
  Future<Response<Fascia>> getFasciaUsingGET(
    int id, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String _path =
        '/api/fascias/{id}'.replaceAll('{' r'id' '}', id.toString());

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

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
          'secure': [],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer =
          _serializers.serializerForType(Fascia) as Serializer<Fascia>;
      final data = _serializers.deserializeWith<Fascia>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Fascia>(
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

  /// partialUpdateFascia
  ///
  ///
  Future<Response<Fascia>> partialUpdateFasciaUsingPATCH({
    Fascia? fascia,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/fascias';

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

    final serializedBody = _serializers.serialize(fascia);
    final jsonfascia = json.encode(serializedBody);
    bodyData = jsonfascia;

    return _dio
        .request(
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
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer =
          _serializers.serializerForType(Fascia) as Serializer<Fascia>;
      final data = _serializers.deserializeWith<Fascia>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Fascia>(
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

  /// updateFascia
  ///
  ///
  Future<Response<Fascia>> updateFasciaUsingPUT({
    Fascia? fascia,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/fascias';

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

    final serializedBody = _serializers.serialize(fascia);
    final jsonfascia = json.encode(serializedBody);
    bodyData = jsonfascia;

    return _dio
        .request(
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
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer =
          _serializers.serializerForType(Fascia) as Serializer<Fascia>;
      final data = _serializers.deserializeWith<Fascia>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Fascia>(
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
