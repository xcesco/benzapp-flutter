import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleViewModel with ChangeNotifier {
  final List<Vehicle> _items = [];

  List<Vehicle> get items {
    return [..._items];
  }

  void addVehicle() {
    notifyListeners();
  }
}
