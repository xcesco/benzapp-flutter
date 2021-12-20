import 'package:benzapp_flutter/models/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleProvider with ChangeNotifier {
  final List<Vehicle> _items = [];

  List<Vehicle> get items {
    return [..._items];
  }

  void addVehicle() {
    notifyListeners();
  }
}
