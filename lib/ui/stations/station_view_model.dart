import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/stations_repository.dart';

import '../../viewmodels/base_view_model.dart';

class StationsViewModel extends BaseViewModel {
  final StationsRepository _repository;

  StationsViewModel(this._repository);

  Future<List<Station>> loadData() async => await _repository.getData();
}
