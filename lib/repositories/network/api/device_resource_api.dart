import 'dart:async';
import 'dart:convert';

import 'package:benzapp_flutter/repositories/network/model/device.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

class DeviceResourceApi {
  final Dio _dio;
  final Serializers _serializers;

  DeviceResourceApi(this._dio, this._serializers);


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

    queryParams.removeWhere((String key, value) => value == null);
    headerParams.removeWhere((String key, value) => value == null);

    final List<String> contentTypes = [
      'application/json',
    ];

    final Object? serializedBody = _serializers.serialize(device);
    final String jsondevice = json.encode(serializedBody);
    bodyData = jsondevice;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
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
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((Response response) {
      final Serializer<Device> serializer =
          _serializers.serializerForType(Device) as Serializer<Device>;
      final Device? data = _serializers.deserializeWith<Device>(serializer,
          response.data is String ? jsonDecode(response.data) : response.data);

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
