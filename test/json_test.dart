// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child ui in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';

import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Load a file', () async {
    Set<Station> current = <Station>{};
    final File file = File('test_resources/stations.json');
    final json = await file.readAsString();
    for (dynamic item in jsonDecode(json) as List<dynamic>) {
      current.add(Station.fromJson(item));
      print(current);
    }
    // final seth = contacts.first;
    // expect(seth['id'], 1);
    // expect(seth['name'], 'Seth Ladd');
    //
    // final eric = contacts.last;
    // expect(eric['id'], 2);
    // expect(eric['name'], 'Eric Seidel');
  });
}
