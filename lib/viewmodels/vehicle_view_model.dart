import 'package:benzapp_flutter/repositories/model/vehicle.dart';

import 'base_view_model.dart';

class VehicleViewModel extends BaseViewModel {
  final List<Vehicle> _items = [];

  List<Vehicle> get items {
    return [..._items];
  }

  void addVehicle() {
    notifyListeners();
  }
}
