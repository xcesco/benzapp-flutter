import 'dart:convert';

import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/ui/stations/station_item_widget.dart';
import 'package:benzapp_flutter/viewmodels/station_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationsListFragment extends StatelessWidget {
  const StationsListFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Consumer<StationsViewModel>(
            builder: (BuildContext context, StationsViewModel stationModel, Widget? child) =>
                FutureBuilder<List<Station>>(
                  future: stationModel.loadData(),
                  initialData: const <Station>[],
                  builder: (BuildContext buildContext, AsyncSnapshot<List<Station>> snapshot) => ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int position) => StationItem(snapshot.data![position]),
                    itemCount: snapshot.data!.length,
                  ),
                )));
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      width: 72,
      height: 72,
    );
  }
}
