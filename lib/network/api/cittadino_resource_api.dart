import 'dart:async';
import 'dart:convert';

import 'package:benzapp_flutter/network/model/cittadino.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

class CittadinoResourceApi {
  final Dio _dio;
  final Serializers _serializers;

  CittadinoResourceApi(this._dio, this._serializers);

  /// countCittadinos
  ///
  ///
  Future<Response<int>> countCittadinosUsingGET({
    String? codiceFiscalePeriodContains,
    String? codiceFiscalePeriodDoesNotContain,
    String? codiceFiscalePeriodEquals,
    BuiltList<String>? codiceFiscalePeriodIn,
    String? codiceFiscalePeriodNotEquals,
    BuiltList<String>? codiceFiscalePeriodNotIn,
    bool? codiceFiscalePeriodSpecified,
    String? cognomePeriodContains,
    String? cognomePeriodDoesNotContain,
    String? cognomePeriodEquals,
    BuiltList<String>? cognomePeriodIn,
    String? cognomePeriodNotEquals,
    BuiltList<String>? cognomePeriodNotIn,
    bool? cognomePeriodSpecified,
    int? delegaIdPeriodEquals,
    int? delegaIdPeriodGreaterThan,
    int? delegaIdPeriodGreaterThanOrEqual,
    BuiltList<int>? delegaIdPeriodIn,
    int? delegaIdPeriodLessThan,
    int? delegaIdPeriodLessThanOrEqual,
    int? delegaIdPeriodNotEquals,
    BuiltList<int>? delegaIdPeriodNotIn,
    bool? delegaIdPeriodSpecified,
    int? fasciaIdPeriodEquals,
    int? fasciaIdPeriodGreaterThan,
    int? fasciaIdPeriodGreaterThanOrEqual,
    BuiltList<int>? fasciaIdPeriodIn,
    int? fasciaIdPeriodLessThan,
    int? fasciaIdPeriodLessThanOrEqual,
    int? fasciaIdPeriodNotEquals,
    BuiltList<int>? fasciaIdPeriodNotIn,
    bool? fasciaIdPeriodSpecified,
    int? idPeriodEquals,
    int? idPeriodGreaterThan,
    int? idPeriodGreaterThanOrEqual,
    BuiltList<int>? idPeriodIn,
    int? idPeriodLessThan,
    int? idPeriodLessThanOrEqual,
    int? idPeriodNotEquals,
    BuiltList<int>? idPeriodNotIn,
    bool? idPeriodSpecified,
    String? nomePeriodContains,
    String? nomePeriodDoesNotContain,
    String? nomePeriodEquals,
    BuiltList<String>? nomePeriodIn,
    String? nomePeriodNotEquals,
    BuiltList<String>? nomePeriodNotIn,
    bool? nomePeriodSpecified,
    String? ownerPeriodContains,
    String? ownerPeriodDoesNotContain,
    String? ownerPeriodEquals,
    BuiltList<String>? ownerPeriodIn,
    String? ownerPeriodNotEquals,
    BuiltList<String>? ownerPeriodNotIn,
    bool? ownerPeriodSpecified,
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
    const String _path = '/api/cittadinos/count';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams[r'codiceFiscale.contains'] = codiceFiscalePeriodContains;
    queryParams[r'codiceFiscale.doesNotContain'] =
        codiceFiscalePeriodDoesNotContain;
    queryParams[r'codiceFiscale.equals'] = codiceFiscalePeriodEquals;
    queryParams[r'codiceFiscale.in'] = codiceFiscalePeriodIn;
    queryParams[r'codiceFiscale.notEquals'] = codiceFiscalePeriodNotEquals;
    queryParams[r'codiceFiscale.notIn'] = codiceFiscalePeriodNotIn;
    queryParams[r'codiceFiscale.specified'] = codiceFiscalePeriodSpecified;
    queryParams[r'cognome.contains'] = cognomePeriodContains;
    queryParams[r'cognome.doesNotContain'] = cognomePeriodDoesNotContain;
    queryParams[r'cognome.equals'] = cognomePeriodEquals;
    queryParams[r'cognome.in'] = cognomePeriodIn;
    queryParams[r'cognome.notEquals'] = cognomePeriodNotEquals;
    queryParams[r'cognome.notIn'] = cognomePeriodNotIn;
    queryParams[r'cognome.specified'] = cognomePeriodSpecified;
    queryParams[r'delegaId.equals'] = delegaIdPeriodEquals;
    queryParams[r'delegaId.greaterThan'] = delegaIdPeriodGreaterThan;
    queryParams[r'delegaId.greaterThanOrEqual'] =
        delegaIdPeriodGreaterThanOrEqual;
    queryParams[r'delegaId.in'] = delegaIdPeriodIn;
    queryParams[r'delegaId.lessThan'] = delegaIdPeriodLessThan;
    queryParams[r'delegaId.lessThanOrEqual'] = delegaIdPeriodLessThanOrEqual;
    queryParams[r'delegaId.notEquals'] = delegaIdPeriodNotEquals;
    queryParams[r'delegaId.notIn'] = delegaIdPeriodNotIn;
    queryParams[r'delegaId.specified'] = delegaIdPeriodSpecified;
    queryParams[r'fasciaId.equals'] = fasciaIdPeriodEquals;
    queryParams[r'fasciaId.greaterThan'] = fasciaIdPeriodGreaterThan;
    queryParams[r'fasciaId.greaterThanOrEqual'] =
        fasciaIdPeriodGreaterThanOrEqual;
    queryParams[r'fasciaId.in'] = fasciaIdPeriodIn;
    queryParams[r'fasciaId.lessThan'] = fasciaIdPeriodLessThan;
    queryParams[r'fasciaId.lessThanOrEqual'] = fasciaIdPeriodLessThanOrEqual;
    queryParams[r'fasciaId.notEquals'] = fasciaIdPeriodNotEquals;
    queryParams[r'fasciaId.notIn'] = fasciaIdPeriodNotIn;
    queryParams[r'fasciaId.specified'] = fasciaIdPeriodSpecified;
    queryParams[r'id.equals'] = idPeriodEquals;
    queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
    queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
    queryParams[r'id.in'] = idPeriodIn;
    queryParams[r'id.lessThan'] = idPeriodLessThan;
    queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
    queryParams[r'id.notEquals'] = idPeriodNotEquals;
    queryParams[r'id.notIn'] = idPeriodNotIn;
    queryParams[r'id.specified'] = idPeriodSpecified;
    queryParams[r'nome.contains'] = nomePeriodContains;
    queryParams[r'nome.doesNotContain'] = nomePeriodDoesNotContain;
    queryParams[r'nome.equals'] = nomePeriodEquals;
    queryParams[r'nome.in'] = nomePeriodIn;
    queryParams[r'nome.notEquals'] = nomePeriodNotEquals;
    queryParams[r'nome.notIn'] = nomePeriodNotIn;
    queryParams[r'nome.specified'] = nomePeriodSpecified;
    queryParams[r'owner.contains'] = ownerPeriodContains;
    queryParams[r'owner.doesNotContain'] = ownerPeriodDoesNotContain;
    queryParams[r'owner.equals'] = ownerPeriodEquals;
    queryParams[r'owner.in'] = ownerPeriodIn;
    queryParams[r'owner.notEquals'] = ownerPeriodNotEquals;
    queryParams[r'owner.notIn'] = ownerPeriodNotIn;
    queryParams[r'owner.specified'] = ownerPeriodSpecified;
    queryParams[r'tesseraId.equals'] = tesseraIdPeriodEquals;
    queryParams[r'tesseraId.greaterThan'] = tesseraIdPeriodGreaterThan;
    queryParams[r'tesseraId.greaterThanOrEqual'] =
        tesseraIdPeriodGreaterThanOrEqual;
    queryParams[r'tesseraId.in'] = tesseraIdPeriodIn;
    queryParams[r'tesseraId.lessThan'] = tesseraIdPeriodLessThan;
    queryParams[r'tesseraId.lessThanOrEqual'] = tesseraIdPeriodLessThanOrEqual;
    queryParams[r'tesseraId.notEquals'] = tesseraIdPeriodNotEquals;
    queryParams[r'tesseraId.notIn'] = tesseraIdPeriodNotIn;
    queryParams[r'tesseraId.specified'] = tesseraIdPeriodSpecified;
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

  /// createCittadino
  ///
  ///
  Future<Response<Cittadino>> createCittadinoUsingPOST({
    Cittadino? cittadino,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/cittadinos';

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

    final serializedBody = _serializers.serialize(cittadino);
    final jsoncittadino = json.encode(serializedBody);
    bodyData = jsoncittadino;

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
          _serializers.serializerForType(Cittadino) as Serializer<Cittadino>;
      final data = _serializers.deserializeWith<Cittadino>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Cittadino>(
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

  /// deleteCittadino
  ///
  ///
  Future<Response<void>> deleteCittadinoUsingDELETE(
    int id, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String _path =
        '/api/cittadinos/{id}'.replaceAll('{' r'id' '}', id.toString());

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

  /// getAllCittadinos
  ///
  ///
  Future<Response<BuiltList<Cittadino>>> getAllCittadinosUsingGET({
    String? codiceFiscalePeriodContains,
    String? codiceFiscalePeriodDoesNotContain,
    String? codiceFiscalePeriodEquals,
    BuiltList<String>? codiceFiscalePeriodIn,
    String? codiceFiscalePeriodNotEquals,
    BuiltList<String>? codiceFiscalePeriodNotIn,
    bool? codiceFiscalePeriodSpecified,
    String? cognomePeriodContains,
    String? cognomePeriodDoesNotContain,
    String? cognomePeriodEquals,
    BuiltList<String>? cognomePeriodIn,
    String? cognomePeriodNotEquals,
    BuiltList<String>? cognomePeriodNotIn,
    bool? cognomePeriodSpecified,
    int? delegaIdPeriodEquals,
    int? delegaIdPeriodGreaterThan,
    int? delegaIdPeriodGreaterThanOrEqual,
    BuiltList<int>? delegaIdPeriodIn,
    int? delegaIdPeriodLessThan,
    int? delegaIdPeriodLessThanOrEqual,
    int? delegaIdPeriodNotEquals,
    BuiltList<int>? delegaIdPeriodNotIn,
    bool? delegaIdPeriodSpecified,
    int? fasciaIdPeriodEquals,
    int? fasciaIdPeriodGreaterThan,
    int? fasciaIdPeriodGreaterThanOrEqual,
    BuiltList<int>? fasciaIdPeriodIn,
    int? fasciaIdPeriodLessThan,
    int? fasciaIdPeriodLessThanOrEqual,
    int? fasciaIdPeriodNotEquals,
    BuiltList<int>? fasciaIdPeriodNotIn,
    bool? fasciaIdPeriodSpecified,
    int? idPeriodEquals,
    int? idPeriodGreaterThan,
    int? idPeriodGreaterThanOrEqual,
    BuiltList<int>? idPeriodIn,
    int? idPeriodLessThan,
    int? idPeriodLessThanOrEqual,
    int? idPeriodNotEquals,
    BuiltList<int>? idPeriodNotIn,
    bool? idPeriodSpecified,
    String? nomePeriodContains,
    String? nomePeriodDoesNotContain,
    String? nomePeriodEquals,
    BuiltList<String>? nomePeriodIn,
    String? nomePeriodNotEquals,
    BuiltList<String>? nomePeriodNotIn,
    bool? nomePeriodSpecified,
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
    const String _path = '/api/cittadinos';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams[r'codiceFiscale.contains'] = codiceFiscalePeriodContains;
    queryParams[r'codiceFiscale.doesNotContain'] =
        codiceFiscalePeriodDoesNotContain;
    queryParams[r'codiceFiscale.equals'] = codiceFiscalePeriodEquals;
    queryParams[r'codiceFiscale.in'] = codiceFiscalePeriodIn;
    queryParams[r'codiceFiscale.notEquals'] = codiceFiscalePeriodNotEquals;
    queryParams[r'codiceFiscale.notIn'] = codiceFiscalePeriodNotIn;
    queryParams[r'codiceFiscale.specified'] = codiceFiscalePeriodSpecified;
    queryParams[r'cognome.contains'] = cognomePeriodContains;
    queryParams[r'cognome.doesNotContain'] = cognomePeriodDoesNotContain;
    queryParams[r'cognome.equals'] = cognomePeriodEquals;
    queryParams[r'cognome.in'] = cognomePeriodIn;
    queryParams[r'cognome.notEquals'] = cognomePeriodNotEquals;
    queryParams[r'cognome.notIn'] = cognomePeriodNotIn;
    queryParams[r'cognome.specified'] = cognomePeriodSpecified;
    queryParams[r'delegaId.equals'] = delegaIdPeriodEquals;
    queryParams[r'delegaId.greaterThan'] = delegaIdPeriodGreaterThan;
    queryParams[r'delegaId.greaterThanOrEqual'] =
        delegaIdPeriodGreaterThanOrEqual;
    queryParams[r'delegaId.in'] = delegaIdPeriodIn;
    queryParams[r'delegaId.lessThan'] = delegaIdPeriodLessThan;
    queryParams[r'delegaId.lessThanOrEqual'] = delegaIdPeriodLessThanOrEqual;
    queryParams[r'delegaId.notEquals'] = delegaIdPeriodNotEquals;
    queryParams[r'delegaId.notIn'] = delegaIdPeriodNotIn;
    queryParams[r'delegaId.specified'] = delegaIdPeriodSpecified;
    queryParams[r'fasciaId.equals'] = fasciaIdPeriodEquals;
    queryParams[r'fasciaId.greaterThan'] = fasciaIdPeriodGreaterThan;
    queryParams[r'fasciaId.greaterThanOrEqual'] =
        fasciaIdPeriodGreaterThanOrEqual;
    queryParams[r'fasciaId.in'] = fasciaIdPeriodIn;
    queryParams[r'fasciaId.lessThan'] = fasciaIdPeriodLessThan;
    queryParams[r'fasciaId.lessThanOrEqual'] = fasciaIdPeriodLessThanOrEqual;
    queryParams[r'fasciaId.notEquals'] = fasciaIdPeriodNotEquals;
    queryParams[r'fasciaId.notIn'] = fasciaIdPeriodNotIn;
    queryParams[r'fasciaId.specified'] = fasciaIdPeriodSpecified;
    queryParams[r'id.equals'] = idPeriodEquals;
    queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
    queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
    queryParams[r'id.in'] = idPeriodIn;
    queryParams[r'id.lessThan'] = idPeriodLessThan;
    queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
    queryParams[r'id.notEquals'] = idPeriodNotEquals;
    queryParams[r'id.notIn'] = idPeriodNotIn;
    queryParams[r'id.specified'] = idPeriodSpecified;
    queryParams[r'nome.contains'] = nomePeriodContains;
    queryParams[r'nome.doesNotContain'] = nomePeriodDoesNotContain;
    queryParams[r'nome.equals'] = nomePeriodEquals;
    queryParams[r'nome.in'] = nomePeriodIn;
    queryParams[r'nome.notEquals'] = nomePeriodNotEquals;
    queryParams[r'nome.notIn'] = nomePeriodNotIn;
    queryParams[r'nome.specified'] = nomePeriodSpecified;
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
    queryParams[r'tesseraId.equals'] = tesseraIdPeriodEquals;
    queryParams[r'tesseraId.greaterThan'] = tesseraIdPeriodGreaterThan;
    queryParams[r'tesseraId.greaterThanOrEqual'] =
        tesseraIdPeriodGreaterThanOrEqual;
    queryParams[r'tesseraId.in'] = tesseraIdPeriodIn;
    queryParams[r'tesseraId.lessThan'] = tesseraIdPeriodLessThan;
    queryParams[r'tesseraId.lessThanOrEqual'] = tesseraIdPeriodLessThanOrEqual;
    queryParams[r'tesseraId.notEquals'] = tesseraIdPeriodNotEquals;
    queryParams[r'tesseraId.notIn'] = tesseraIdPeriodNotIn;
    queryParams[r'tesseraId.specified'] = tesseraIdPeriodSpecified;
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
      const type = FullType(collectionType, [FullType(Cittadino)]);
      final BuiltList<Cittadino> data = _serializers.deserialize(
          response.data is String ? jsonDecode(response.data) : response.data,
          specifiedType: type) as BuiltList<Cittadino>;

      return Response<BuiltList<Cittadino>>(
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

  /// getCittadino
  ///
  ///
  Future<Response<Cittadino>> getCittadinoUsingGET(
    int id, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String _path =
        '/api/cittadinos/{id}'.replaceAll('{' r'id' '}', id.toString());

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
          _serializers.serializerForType(Cittadino) as Serializer<Cittadino>;
      final data = _serializers.deserializeWith<Cittadino>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Cittadino>(
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

  /// partialUpdateCittadino
  ///
  ///
  Future<Response<Cittadino>> partialUpdateCittadinoUsingPATCH({
    Cittadino? cittadino,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/cittadinos';

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

    final serializedBody = _serializers.serialize(cittadino);
    final jsoncittadino = json.encode(serializedBody);
    bodyData = jsoncittadino;

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
          _serializers.serializerForType(Cittadino) as Serializer<Cittadino>;
      final data = _serializers.deserializeWith<Cittadino>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Cittadino>(
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

  /// updateCittadino
  ///
  ///
  Future<Response<Cittadino>> updateCittadinoUsingPUT({
    Cittadino? cittadino,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/cittadinos';

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

    final serializedBody = _serializers.serialize(cittadino);
    final jsoncittadino = json.encode(serializedBody);
    bodyData = jsoncittadino;

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
          _serializers.serializerForType(Cittadino) as Serializer<Cittadino>;
      final data = _serializers.deserializeWith<Cittadino>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Cittadino>(
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
