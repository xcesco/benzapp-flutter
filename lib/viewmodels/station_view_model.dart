
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:flutter/cupertino.dart';

class StationsViewModel extends ChangeNotifier {
  Set<Station> _stations = <Station>{};

  Set<Station> get stations {
    return {..._stations};
  }

  void loadData() async {
    Set<Station> current = <Station>{};
    print("-------->loadData begin");

    // var value = await rootBundle.loadString('assets/json/stations.json');
    // for (dynamic item in jsonDecode(value) as List<dynamic>) {
    //   current.add(Station.fromJson(item));
    // }
    _stations = current;
    notifyListeners();
    print("-------->loadData finished");
  }
}
