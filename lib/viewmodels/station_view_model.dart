import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/stations_repository.dart';

import 'base_view_model.dart';

class StationsViewModel extends BaseViewModel {
  StationsRepository _stationRepository;

  StationsViewModel(this._stationRepository);

  Future<List<Station>> loadData() async {
    AppDebug.log("-------->loadData begin");

    final List<Station> stations = await _stationRepository.loadStations();

    return stations;
  }
}
