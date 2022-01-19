// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child ui in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';

import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/ui/qrcode/qrcode_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Load a file', () async {
    final Set<Station> current = <Station>{};
    final File file = File('test_resources/stations.json');
    final String json = await file.readAsString();
    for (final dynamic item in jsonDecode(json) as List<dynamic>) {
      current.add(Station.fromJson(item));
     // AppDebug.log(current);
    }
    // final seth = contacts.first;
    // expect(seth['id'], 1);
    // expect(seth['name'], 'Seth Ladd');
    //
    // final eric = contacts.last;
    // expect(eric['id'], 2);
    // expect(eric['name'], 'Eric Seidel');
  });

  test('Load qrcode', () async {
    String json =
        '{"tesseraNumero": "10000", "codiceFiscale":"BRNFNC80A01I533L", "targa":"TSAAAAAA", "veicolo":"AUTOVEICOLO", "carburante":"BENZINA"}';

    QRCodeData qrCode = QRCodeData.fromJson(jsonDecode(json));

    AppDebug.log(jsonEncode(qrCode.toJson()));
  });
}
