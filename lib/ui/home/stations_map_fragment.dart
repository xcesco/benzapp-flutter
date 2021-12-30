import 'dart:async';

import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/ui/widgets/stations_map_widget.dart';
import 'package:benzapp_flutter/viewmodels/station_view_model.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:provider/provider.dart';

class StationsMapFragment extends StatefulWidget {
  const StationsMapFragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StationsMapFragmentState();
}

class _StationsMapFragmentState extends State<StationsMapFragment> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Station>?> _prepareData(StationsViewModel stationsViewModel) async {
    final List<Station>? stations = await stationsViewModel.loadData();
    if (stations != null && stations.isNotEmpty) {
      AppDebug.log("sssssssssssssssssssssssssssssssssssssssssssssssssss");
    }
    return stations;
  }

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.white,
      child: Consumer<StationsViewModel>(
        builder: (BuildContext context, StationsViewModel stationModel, Widget? child) => FutureBuilder<List<Station>?>(
            future: _prepareData(stationModel),
            initialData: null,
            builder: (BuildContext buildContext, AsyncSnapshot<List<Station>?> snapshot) {
              AppDebug.log("@@@@@@ REALOAD ${snapshot.data?.length}");
              return StationsMap(snapshot.data ?? []);
            }),
      ));
}
