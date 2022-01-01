import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/refueling_repository.dart';
import 'package:benzapp_flutter/repositories/stations_repository.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_item_widget.dart';

import '../../viewmodels/base_view_model.dart';

class RefuelingViewModel extends BaseViewModel {
  final RefuelingRepository _repository;

  RefuelingViewModel(this._repository);

  Future<List<Refueling>> loadData() async => await _repository.getData();
}
