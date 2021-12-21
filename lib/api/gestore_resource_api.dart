import 'dart:async';
import 'dart:convert';

import 'package:benzapp_flutter/model/gestore.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

class GestoreResourceApi {
  final Dio _dio;
  final Serializers _serializers;

  GestoreResourceApi(this._dio, this._serializers);

  /// countGestores
  ///
  ///
  Future<Response<int>> countGestoresUsingGET({
    double? benzinaPrezzoAlLitroPeriodEquals,
    double? benzinaPrezzoAlLitroPeriodGreaterThan,
    double? benzinaPrezzoAlLitroPeriodGreaterThanOrEqual,
    BuiltList<num>? benzinaPrezzoAlLitroPeriodIn,
    double? benzinaPrezzoAlLitroPeriodLessThan,
    double? benzinaPrezzoAlLitroPeriodLessThanOrEqual,
    double? benzinaPrezzoAlLitroPeriodNotEquals,
    BuiltList<num>? benzinaPrezzoAlLitroPeriodNotIn,
    bool? benzinaPrezzoAlLitroPeriodSpecified,
    String? comunePeriodContains,
    String? comunePeriodDoesNotContain,
    String? comunePeriodEquals,
    BuiltList<String>? comunePeriodIn,
    String? comunePeriodNotEquals,
    BuiltList<String>? comunePeriodNotIn,
    bool? comunePeriodSpecified,
    double? gasolioPrezzoAlLitroPeriodEquals,
    double? gasolioPrezzoAlLitroPeriodGreaterThan,
    double? gasolioPrezzoAlLitroPeriodGreaterThanOrEqual,
    BuiltList<num>? gasolioPrezzoAlLitroPeriodIn,
    double? gasolioPrezzoAlLitroPeriodLessThan,
    double? gasolioPrezzoAlLitroPeriodLessThanOrEqual,
    double? gasolioPrezzoAlLitroPeriodNotEquals,
    BuiltList<num>? gasolioPrezzoAlLitroPeriodNotIn,
    bool? gasolioPrezzoAlLitroPeriodSpecified,
    int? idPeriodEquals,
    int? idPeriodGreaterThan,
    int? idPeriodGreaterThanOrEqual,
    BuiltList<int>? idPeriodIn,
    int? idPeriodLessThan,
    int? idPeriodLessThanOrEqual,
    int? idPeriodNotEquals,
    BuiltList<int>? idPeriodNotIn,
    bool? idPeriodSpecified,
    String? indirizzoPeriodContains,
    String? indirizzoPeriodDoesNotContain,
    String? indirizzoPeriodEquals,
    BuiltList<String>? indirizzoPeriodIn,
    String? indirizzoPeriodNotEquals,
    BuiltList<String>? indirizzoPeriodNotIn,
    bool? indirizzoPeriodSpecified,
    double? latitudinePeriodEquals,
    double? latitudinePeriodGreaterThan,
    double? latitudinePeriodGreaterThanOrEqual,
    BuiltList<num>? latitudinePeriodIn,
    double? latitudinePeriodLessThan,
    double? latitudinePeriodLessThanOrEqual,
    double? latitudinePeriodNotEquals,
    BuiltList<num>? latitudinePeriodNotIn,
    bool? latitudinePeriodSpecified,
    double? longitudinePeriodEquals,
    double? longitudinePeriodGreaterThan,
    double? longitudinePeriodGreaterThanOrEqual,
    BuiltList<num>? longitudinePeriodIn,
    double? longitudinePeriodLessThan,
    double? longitudinePeriodLessThanOrEqual,
    double? longitudinePeriodNotEquals,
    BuiltList<num>? longitudinePeriodNotIn,
    bool? longitudinePeriodSpecified,
    int? marchioIdPeriodEquals,
    int? marchioIdPeriodGreaterThan,
    int? marchioIdPeriodGreaterThanOrEqual,
    BuiltList<int>? marchioIdPeriodIn,
    int? marchioIdPeriodLessThan,
    int? marchioIdPeriodLessThanOrEqual,
    int? marchioIdPeriodNotEquals,
    BuiltList<int>? marchioIdPeriodNotIn,
    bool? marchioIdPeriodSpecified,
    String? ownerPeriodContains,
    String? ownerPeriodDoesNotContain,
    String? ownerPeriodEquals,
    BuiltList<String>? ownerPeriodIn,
    String? ownerPeriodNotEquals,
    BuiltList<String>? ownerPeriodNotIn,
    bool? ownerPeriodSpecified,
    String? provinciaPeriodContains,
    String? provinciaPeriodDoesNotContain,
    String? provinciaPeriodEquals,
    BuiltList<String>? provinciaPeriodIn,
    String? provinciaPeriodNotEquals,
    BuiltList<String>? provinciaPeriodNotIn,
    bool? provinciaPeriodSpecified,
    int? rifornimentoIdPeriodEquals,
    int? rifornimentoIdPeriodGreaterThan,
    int? rifornimentoIdPeriodGreaterThanOrEqual,
    BuiltList<int>? rifornimentoIdPeriodIn,
    int? rifornimentoIdPeriodLessThan,
    int? rifornimentoIdPeriodLessThanOrEqual,
    int? rifornimentoIdPeriodNotEquals,
    BuiltList<int>? rifornimentoIdPeriodNotIn,
    bool? rifornimentoIdPeriodSpecified,
    String? tipoPeriodEquals,
    BuiltList<String>? tipoPeriodIn,
    String? tipoPeriodNotEquals,
    BuiltList<String>? tipoPeriodNotIn,
    bool? tipoPeriodSpecified,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/gestores/count';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams[r'benzinaPrezzoAlLitro.equals'] =
        benzinaPrezzoAlLitroPeriodEquals;
    queryParams[r'benzinaPrezzoAlLitro.greaterThan'] =
        benzinaPrezzoAlLitroPeriodGreaterThan;
    queryParams[r'benzinaPrezzoAlLitro.greaterThanOrEqual'] =
        benzinaPrezzoAlLitroPeriodGreaterThanOrEqual;
    queryParams[r'benzinaPrezzoAlLitro.in'] = benzinaPrezzoAlLitroPeriodIn;
    queryParams[r'benzinaPrezzoAlLitro.lessThan'] =
        benzinaPrezzoAlLitroPeriodLessThan;
    queryParams[r'benzinaPrezzoAlLitro.lessThanOrEqual'] =
        benzinaPrezzoAlLitroPeriodLessThanOrEqual;
    queryParams[r'benzinaPrezzoAlLitro.notEquals'] =
        benzinaPrezzoAlLitroPeriodNotEquals;
    queryParams[r'benzinaPrezzoAlLitro.notIn'] =
        benzinaPrezzoAlLitroPeriodNotIn;
    queryParams[r'benzinaPrezzoAlLitro.specified'] =
        benzinaPrezzoAlLitroPeriodSpecified;
    queryParams[r'comune.contains'] = comunePeriodContains;
    queryParams[r'comune.doesNotContain'] = comunePeriodDoesNotContain;
    queryParams[r'comune.equals'] = comunePeriodEquals;
    queryParams[r'comune.in'] = comunePeriodIn;
    queryParams[r'comune.notEquals'] = comunePeriodNotEquals;
    queryParams[r'comune.notIn'] = comunePeriodNotIn;
    queryParams[r'comune.specified'] = comunePeriodSpecified;
    queryParams[r'gasolioPrezzoAlLitro.equals'] =
        gasolioPrezzoAlLitroPeriodEquals;
    queryParams[r'gasolioPrezzoAlLitro.greaterThan'] =
        gasolioPrezzoAlLitroPeriodGreaterThan;
    queryParams[r'gasolioPrezzoAlLitro.greaterThanOrEqual'] =
        gasolioPrezzoAlLitroPeriodGreaterThanOrEqual;
    queryParams[r'gasolioPrezzoAlLitro.in'] = gasolioPrezzoAlLitroPeriodIn;
    queryParams[r'gasolioPrezzoAlLitro.lessThan'] =
        gasolioPrezzoAlLitroPeriodLessThan;
    queryParams[r'gasolioPrezzoAlLitro.lessThanOrEqual'] =
        gasolioPrezzoAlLitroPeriodLessThanOrEqual;
    queryParams[r'gasolioPrezzoAlLitro.notEquals'] =
        gasolioPrezzoAlLitroPeriodNotEquals;
    queryParams[r'gasolioPrezzoAlLitro.notIn'] =
        gasolioPrezzoAlLitroPeriodNotIn;
    queryParams[r'gasolioPrezzoAlLitro.specified'] =
        gasolioPrezzoAlLitroPeriodSpecified;
    queryParams[r'id.equals'] = idPeriodEquals;
    queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
    queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
    queryParams[r'id.in'] = idPeriodIn;
    queryParams[r'id.lessThan'] = idPeriodLessThan;
    queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
    queryParams[r'id.notEquals'] = idPeriodNotEquals;
    queryParams[r'id.notIn'] = idPeriodNotIn;
    queryParams[r'id.specified'] = idPeriodSpecified;
    queryParams[r'indirizzo.contains'] = indirizzoPeriodContains;
    queryParams[r'indirizzo.doesNotContain'] = indirizzoPeriodDoesNotContain;
    queryParams[r'indirizzo.equals'] = indirizzoPeriodEquals;
    queryParams[r'indirizzo.in'] = indirizzoPeriodIn;
    queryParams[r'indirizzo.notEquals'] = indirizzoPeriodNotEquals;
    queryParams[r'indirizzo.notIn'] = indirizzoPeriodNotIn;
    queryParams[r'indirizzo.specified'] = indirizzoPeriodSpecified;
    queryParams[r'latitudine.equals'] = latitudinePeriodEquals;
    queryParams[r'latitudine.greaterThan'] = latitudinePeriodGreaterThan;
    queryParams[r'latitudine.greaterThanOrEqual'] =
        latitudinePeriodGreaterThanOrEqual;
    queryParams[r'latitudine.in'] = latitudinePeriodIn;
    queryParams[r'latitudine.lessThan'] = latitudinePeriodLessThan;
    queryParams[r'latitudine.lessThanOrEqual'] =
        latitudinePeriodLessThanOrEqual;
    queryParams[r'latitudine.notEquals'] = latitudinePeriodNotEquals;
    queryParams[r'latitudine.notIn'] = latitudinePeriodNotIn;
    queryParams[r'latitudine.specified'] = latitudinePeriodSpecified;
    queryParams[r'longitudine.equals'] = longitudinePeriodEquals;
    queryParams[r'longitudine.greaterThan'] = longitudinePeriodGreaterThan;
    queryParams[r'longitudine.greaterThanOrEqual'] =
        longitudinePeriodGreaterThanOrEqual;
    queryParams[r'longitudine.in'] = longitudinePeriodIn;
    queryParams[r'longitudine.lessThan'] = longitudinePeriodLessThan;
    queryParams[r'longitudine.lessThanOrEqual'] =
        longitudinePeriodLessThanOrEqual;
    queryParams[r'longitudine.notEquals'] = longitudinePeriodNotEquals;
    queryParams[r'longitudine.notIn'] = longitudinePeriodNotIn;
    queryParams[r'longitudine.specified'] = longitudinePeriodSpecified;
    queryParams[r'marchioId.equals'] = marchioIdPeriodEquals;
    queryParams[r'marchioId.greaterThan'] = marchioIdPeriodGreaterThan;
    queryParams[r'marchioId.greaterThanOrEqual'] =
        marchioIdPeriodGreaterThanOrEqual;
    queryParams[r'marchioId.in'] = marchioIdPeriodIn;
    queryParams[r'marchioId.lessThan'] = marchioIdPeriodLessThan;
    queryParams[r'marchioId.lessThanOrEqual'] = marchioIdPeriodLessThanOrEqual;
    queryParams[r'marchioId.notEquals'] = marchioIdPeriodNotEquals;
    queryParams[r'marchioId.notIn'] = marchioIdPeriodNotIn;
    queryParams[r'marchioId.specified'] = marchioIdPeriodSpecified;
    queryParams[r'owner.contains'] = ownerPeriodContains;
    queryParams[r'owner.doesNotContain'] = ownerPeriodDoesNotContain;
    queryParams[r'owner.equals'] = ownerPeriodEquals;
    queryParams[r'owner.in'] = ownerPeriodIn;
    queryParams[r'owner.notEquals'] = ownerPeriodNotEquals;
    queryParams[r'owner.notIn'] = ownerPeriodNotIn;
    queryParams[r'owner.specified'] = ownerPeriodSpecified;
    queryParams[r'provincia.contains'] = provinciaPeriodContains;
    queryParams[r'provincia.doesNotContain'] = provinciaPeriodDoesNotContain;
    queryParams[r'provincia.equals'] = provinciaPeriodEquals;
    queryParams[r'provincia.in'] = provinciaPeriodIn;
    queryParams[r'provincia.notEquals'] = provinciaPeriodNotEquals;
    queryParams[r'provincia.notIn'] = provinciaPeriodNotIn;
    queryParams[r'provincia.specified'] = provinciaPeriodSpecified;
    queryParams[r'rifornimentoId.equals'] = rifornimentoIdPeriodEquals;
    queryParams[r'rifornimentoId.greaterThan'] =
        rifornimentoIdPeriodGreaterThan;
    queryParams[r'rifornimentoId.greaterThanOrEqual'] =
        rifornimentoIdPeriodGreaterThanOrEqual;
    queryParams[r'rifornimentoId.in'] = rifornimentoIdPeriodIn;
    queryParams[r'rifornimentoId.lessThan'] = rifornimentoIdPeriodLessThan;
    queryParams[r'rifornimentoId.lessThanOrEqual'] =
        rifornimentoIdPeriodLessThanOrEqual;
    queryParams[r'rifornimentoId.notEquals'] = rifornimentoIdPeriodNotEquals;
    queryParams[r'rifornimentoId.notIn'] = rifornimentoIdPeriodNotIn;
    queryParams[r'rifornimentoId.specified'] = rifornimentoIdPeriodSpecified;
    queryParams[r'tipo.equals'] = tipoPeriodEquals;
    queryParams[r'tipo.in'] = tipoPeriodIn;
    queryParams[r'tipo.notEquals'] = tipoPeriodNotEquals;
    queryParams[r'tipo.notIn'] = tipoPeriodNotIn;
    queryParams[r'tipo.specified'] = tipoPeriodSpecified;
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

  /// createGestore
  ///
  ///
  Future<Response<Gestore>> createGestoreUsingPOST({
    Gestore? gestore,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/gestores';

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

    final serializedBody = _serializers.serialize(gestore);
    final jsongestore = json.encode(serializedBody);
    bodyData = jsongestore;

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
          _serializers.serializerForType(Gestore) as Serializer<Gestore>;
      final data = _serializers.deserializeWith<Gestore>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Gestore>(
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

  /// deleteGestore
  ///
  ///
  Future<Response<void>> deleteGestoreUsingDELETE(
    int id, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String _path =
        '/api/gestores/{id}'.replaceAll('{' r'id' '}', id.toString());

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

  /// getAllGestores
  ///
  ///
  Future<Response<BuiltList<Gestore>>> getAllGestoresUsingGET({
    double? benzinaPrezzoAlLitroPeriodEquals,
    double? benzinaPrezzoAlLitroPeriodGreaterThan,
    double? benzinaPrezzoAlLitroPeriodGreaterThanOrEqual,
    BuiltList<num>? benzinaPrezzoAlLitroPeriodIn,
    double? benzinaPrezzoAlLitroPeriodLessThan,
    double? benzinaPrezzoAlLitroPeriodLessThanOrEqual,
    double? benzinaPrezzoAlLitroPeriodNotEquals,
    BuiltList<num>? benzinaPrezzoAlLitroPeriodNotIn,
    bool? benzinaPrezzoAlLitroPeriodSpecified,
    String? comunePeriodContains,
    String? comunePeriodDoesNotContain,
    String? comunePeriodEquals,
    BuiltList<String>? comunePeriodIn,
    String? comunePeriodNotEquals,
    BuiltList<String>? comunePeriodNotIn,
    bool? comunePeriodSpecified,
    double? gasolioPrezzoAlLitroPeriodEquals,
    double? gasolioPrezzoAlLitroPeriodGreaterThan,
    double? gasolioPrezzoAlLitroPeriodGreaterThanOrEqual,
    BuiltList<num>? gasolioPrezzoAlLitroPeriodIn,
    double? gasolioPrezzoAlLitroPeriodLessThan,
    double? gasolioPrezzoAlLitroPeriodLessThanOrEqual,
    double? gasolioPrezzoAlLitroPeriodNotEquals,
    BuiltList<num>? gasolioPrezzoAlLitroPeriodNotIn,
    bool? gasolioPrezzoAlLitroPeriodSpecified,
    int? idPeriodEquals,
    int? idPeriodGreaterThan,
    int? idPeriodGreaterThanOrEqual,
    BuiltList<int>? idPeriodIn,
    int? idPeriodLessThan,
    int? idPeriodLessThanOrEqual,
    int? idPeriodNotEquals,
    BuiltList<int>? idPeriodNotIn,
    bool? idPeriodSpecified,
    String? indirizzoPeriodContains,
    String? indirizzoPeriodDoesNotContain,
    String? indirizzoPeriodEquals,
    BuiltList<String>? indirizzoPeriodIn,
    String? indirizzoPeriodNotEquals,
    BuiltList<String>? indirizzoPeriodNotIn,
    bool? indirizzoPeriodSpecified,
    double? latitudinePeriodEquals,
    double? latitudinePeriodGreaterThan,
    double? latitudinePeriodGreaterThanOrEqual,
    BuiltList<num>? latitudinePeriodIn,
    double? latitudinePeriodLessThan,
    double? latitudinePeriodLessThanOrEqual,
    double? latitudinePeriodNotEquals,
    BuiltList<num>? latitudinePeriodNotIn,
    bool? latitudinePeriodSpecified,
    double? longitudinePeriodEquals,
    double? longitudinePeriodGreaterThan,
    double? longitudinePeriodGreaterThanOrEqual,
    BuiltList<num>? longitudinePeriodIn,
    double? longitudinePeriodLessThan,
    double? longitudinePeriodLessThanOrEqual,
    double? longitudinePeriodNotEquals,
    BuiltList<num>? longitudinePeriodNotIn,
    bool? longitudinePeriodSpecified,
    int? marchioIdPeriodEquals,
    int? marchioIdPeriodGreaterThan,
    int? marchioIdPeriodGreaterThanOrEqual,
    BuiltList<int>? marchioIdPeriodIn,
    int? marchioIdPeriodLessThan,
    int? marchioIdPeriodLessThanOrEqual,
    int? marchioIdPeriodNotEquals,
    BuiltList<int>? marchioIdPeriodNotIn,
    bool? marchioIdPeriodSpecified,
    String? ownerPeriodContains,
    String? ownerPeriodDoesNotContain,
    String? ownerPeriodEquals,
    BuiltList<String>? ownerPeriodIn,
    String? ownerPeriodNotEquals,
    BuiltList<String>? ownerPeriodNotIn,
    bool? ownerPeriodSpecified,
    int? page,
    String? provinciaPeriodContains,
    String? provinciaPeriodDoesNotContain,
    String? provinciaPeriodEquals,
    BuiltList<String>? provinciaPeriodIn,
    String? provinciaPeriodNotEquals,
    BuiltList<String>? provinciaPeriodNotIn,
    bool? provinciaPeriodSpecified,
    int? rifornimentoIdPeriodEquals,
    int? rifornimentoIdPeriodGreaterThan,
    int? rifornimentoIdPeriodGreaterThanOrEqual,
    BuiltList<int>? rifornimentoIdPeriodIn,
    int? rifornimentoIdPeriodLessThan,
    int? rifornimentoIdPeriodLessThanOrEqual,
    int? rifornimentoIdPeriodNotEquals,
    BuiltList<int>? rifornimentoIdPeriodNotIn,
    bool? rifornimentoIdPeriodSpecified,
    int? size,
    BuiltList<String>? sort,
    String? tipoPeriodEquals,
    BuiltList<String>? tipoPeriodIn,
    String? tipoPeriodNotEquals,
    BuiltList<String>? tipoPeriodNotIn,
    bool? tipoPeriodSpecified,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/gestores';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams[r'benzinaPrezzoAlLitro.equals'] =
        benzinaPrezzoAlLitroPeriodEquals;
    queryParams[r'benzinaPrezzoAlLitro.greaterThan'] =
        benzinaPrezzoAlLitroPeriodGreaterThan;
    queryParams[r'benzinaPrezzoAlLitro.greaterThanOrEqual'] =
        benzinaPrezzoAlLitroPeriodGreaterThanOrEqual;
    queryParams[r'benzinaPrezzoAlLitro.in'] = benzinaPrezzoAlLitroPeriodIn;
    queryParams[r'benzinaPrezzoAlLitro.lessThan'] =
        benzinaPrezzoAlLitroPeriodLessThan;
    queryParams[r'benzinaPrezzoAlLitro.lessThanOrEqual'] =
        benzinaPrezzoAlLitroPeriodLessThanOrEqual;
    queryParams[r'benzinaPrezzoAlLitro.notEquals'] =
        benzinaPrezzoAlLitroPeriodNotEquals;
    queryParams[r'benzinaPrezzoAlLitro.notIn'] =
        benzinaPrezzoAlLitroPeriodNotIn;
    queryParams[r'benzinaPrezzoAlLitro.specified'] =
        benzinaPrezzoAlLitroPeriodSpecified;
    queryParams[r'comune.contains'] = comunePeriodContains;
    queryParams[r'comune.doesNotContain'] = comunePeriodDoesNotContain;
    queryParams[r'comune.equals'] = comunePeriodEquals;
    queryParams[r'comune.in'] = comunePeriodIn;
    queryParams[r'comune.notEquals'] = comunePeriodNotEquals;
    queryParams[r'comune.notIn'] = comunePeriodNotIn;
    queryParams[r'comune.specified'] = comunePeriodSpecified;
    queryParams[r'gasolioPrezzoAlLitro.equals'] =
        gasolioPrezzoAlLitroPeriodEquals;
    queryParams[r'gasolioPrezzoAlLitro.greaterThan'] =
        gasolioPrezzoAlLitroPeriodGreaterThan;
    queryParams[r'gasolioPrezzoAlLitro.greaterThanOrEqual'] =
        gasolioPrezzoAlLitroPeriodGreaterThanOrEqual;
    queryParams[r'gasolioPrezzoAlLitro.in'] = gasolioPrezzoAlLitroPeriodIn;
    queryParams[r'gasolioPrezzoAlLitro.lessThan'] =
        gasolioPrezzoAlLitroPeriodLessThan;
    queryParams[r'gasolioPrezzoAlLitro.lessThanOrEqual'] =
        gasolioPrezzoAlLitroPeriodLessThanOrEqual;
    queryParams[r'gasolioPrezzoAlLitro.notEquals'] =
        gasolioPrezzoAlLitroPeriodNotEquals;
    queryParams[r'gasolioPrezzoAlLitro.notIn'] =
        gasolioPrezzoAlLitroPeriodNotIn;
    queryParams[r'gasolioPrezzoAlLitro.specified'] =
        gasolioPrezzoAlLitroPeriodSpecified;
    queryParams[r'id.equals'] = idPeriodEquals;
    queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
    queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
    queryParams[r'id.in'] = idPeriodIn;
    queryParams[r'id.lessThan'] = idPeriodLessThan;
    queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
    queryParams[r'id.notEquals'] = idPeriodNotEquals;
    queryParams[r'id.notIn'] = idPeriodNotIn;
    queryParams[r'id.specified'] = idPeriodSpecified;
    queryParams[r'indirizzo.contains'] = indirizzoPeriodContains;
    queryParams[r'indirizzo.doesNotContain'] = indirizzoPeriodDoesNotContain;
    queryParams[r'indirizzo.equals'] = indirizzoPeriodEquals;
    queryParams[r'indirizzo.in'] = indirizzoPeriodIn;
    queryParams[r'indirizzo.notEquals'] = indirizzoPeriodNotEquals;
    queryParams[r'indirizzo.notIn'] = indirizzoPeriodNotIn;
    queryParams[r'indirizzo.specified'] = indirizzoPeriodSpecified;
    queryParams[r'latitudine.equals'] = latitudinePeriodEquals;
    queryParams[r'latitudine.greaterThan'] = latitudinePeriodGreaterThan;
    queryParams[r'latitudine.greaterThanOrEqual'] =
        latitudinePeriodGreaterThanOrEqual;
    queryParams[r'latitudine.in'] = latitudinePeriodIn;
    queryParams[r'latitudine.lessThan'] = latitudinePeriodLessThan;
    queryParams[r'latitudine.lessThanOrEqual'] =
        latitudinePeriodLessThanOrEqual;
    queryParams[r'latitudine.notEquals'] = latitudinePeriodNotEquals;
    queryParams[r'latitudine.notIn'] = latitudinePeriodNotIn;
    queryParams[r'latitudine.specified'] = latitudinePeriodSpecified;
    queryParams[r'longitudine.equals'] = longitudinePeriodEquals;
    queryParams[r'longitudine.greaterThan'] = longitudinePeriodGreaterThan;
    queryParams[r'longitudine.greaterThanOrEqual'] =
        longitudinePeriodGreaterThanOrEqual;
    queryParams[r'longitudine.in'] = longitudinePeriodIn;
    queryParams[r'longitudine.lessThan'] = longitudinePeriodLessThan;
    queryParams[r'longitudine.lessThanOrEqual'] =
        longitudinePeriodLessThanOrEqual;
    queryParams[r'longitudine.notEquals'] = longitudinePeriodNotEquals;
    queryParams[r'longitudine.notIn'] = longitudinePeriodNotIn;
    queryParams[r'longitudine.specified'] = longitudinePeriodSpecified;
    queryParams[r'marchioId.equals'] = marchioIdPeriodEquals;
    queryParams[r'marchioId.greaterThan'] = marchioIdPeriodGreaterThan;
    queryParams[r'marchioId.greaterThanOrEqual'] =
        marchioIdPeriodGreaterThanOrEqual;
    queryParams[r'marchioId.in'] = marchioIdPeriodIn;
    queryParams[r'marchioId.lessThan'] = marchioIdPeriodLessThan;
    queryParams[r'marchioId.lessThanOrEqual'] = marchioIdPeriodLessThanOrEqual;
    queryParams[r'marchioId.notEquals'] = marchioIdPeriodNotEquals;
    queryParams[r'marchioId.notIn'] = marchioIdPeriodNotIn;
    queryParams[r'marchioId.specified'] = marchioIdPeriodSpecified;
    queryParams[r'owner.contains'] = ownerPeriodContains;
    queryParams[r'owner.doesNotContain'] = ownerPeriodDoesNotContain;
    queryParams[r'owner.equals'] = ownerPeriodEquals;
    queryParams[r'owner.in'] = ownerPeriodIn;
    queryParams[r'owner.notEquals'] = ownerPeriodNotEquals;
    queryParams[r'owner.notIn'] = ownerPeriodNotIn;
    queryParams[r'owner.specified'] = ownerPeriodSpecified;
    queryParams[r'page'] = page;
    queryParams[r'provincia.contains'] = provinciaPeriodContains;
    queryParams[r'provincia.doesNotContain'] = provinciaPeriodDoesNotContain;
    queryParams[r'provincia.equals'] = provinciaPeriodEquals;
    queryParams[r'provincia.in'] = provinciaPeriodIn;
    queryParams[r'provincia.notEquals'] = provinciaPeriodNotEquals;
    queryParams[r'provincia.notIn'] = provinciaPeriodNotIn;
    queryParams[r'provincia.specified'] = provinciaPeriodSpecified;
    queryParams[r'rifornimentoId.equals'] = rifornimentoIdPeriodEquals;
    queryParams[r'rifornimentoId.greaterThan'] =
        rifornimentoIdPeriodGreaterThan;
    queryParams[r'rifornimentoId.greaterThanOrEqual'] =
        rifornimentoIdPeriodGreaterThanOrEqual;
    queryParams[r'rifornimentoId.in'] = rifornimentoIdPeriodIn;
    queryParams[r'rifornimentoId.lessThan'] = rifornimentoIdPeriodLessThan;
    queryParams[r'rifornimentoId.lessThanOrEqual'] =
        rifornimentoIdPeriodLessThanOrEqual;
    queryParams[r'rifornimentoId.notEquals'] = rifornimentoIdPeriodNotEquals;
    queryParams[r'rifornimentoId.notIn'] = rifornimentoIdPeriodNotIn;
    queryParams[r'rifornimentoId.specified'] = rifornimentoIdPeriodSpecified;
    queryParams[r'size'] = size;
    queryParams[r'sort'] = sort;
    queryParams[r'tipo.equals'] = tipoPeriodEquals;
    queryParams[r'tipo.in'] = tipoPeriodIn;
    queryParams[r'tipo.notEquals'] = tipoPeriodNotEquals;
    queryParams[r'tipo.notIn'] = tipoPeriodNotIn;
    queryParams[r'tipo.specified'] = tipoPeriodSpecified;
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
      const type = FullType(collectionType, [FullType(Gestore)]);
      final BuiltList<Gestore> data = _serializers.deserialize(
          response.data is String ? jsonDecode(response.data) : response.data,
          specifiedType: type) as BuiltList<Gestore>;

      return Response<BuiltList<Gestore>>(
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

  /// getGestore
  ///
  ///
  Future<Response<Gestore>> getGestoreUsingGET(
    int id, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String _path =
        '/api/gestores/{id}'.replaceAll('{' r'id' '}', id.toString());

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
          _serializers.serializerForType(Gestore) as Serializer<Gestore>;
      final data = _serializers.deserializeWith<Gestore>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Gestore>(
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

  /// partialUpdateGestore
  ///
  ///
  Future<Response<Gestore>> partialUpdateGestoreUsingPATCH({
    Gestore? gestore,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/gestores';

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

    final serializedBody = _serializers.serialize(gestore);
    final jsongestore = json.encode(serializedBody);
    bodyData = jsongestore;

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
          _serializers.serializerForType(Gestore) as Serializer<Gestore>;
      final data = _serializers.deserializeWith<Gestore>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Gestore>(
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

  /// updateGestore
  ///
  ///
  Future<Response<Gestore>> updateGestoreUsingPUT({
    Gestore? gestore,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/gestores';

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

    final serializedBody = _serializers.serialize(gestore);
    final jsongestore = json.encode(serializedBody);
    bodyData = jsongestore;

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
          _serializers.serializerForType(Gestore) as Serializer<Gestore>;
      final data = _serializers.deserializeWith<Gestore>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

      return Response<Gestore>(
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
