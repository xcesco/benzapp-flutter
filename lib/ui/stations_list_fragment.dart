import 'package:benzapp_flutter/repositories/model/station.dart';
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
        builder: (context, stationModel, child) {
          var stations = [...stationModel.stations];
          return ListView.builder(
            itemBuilder: (context, position) {
              return _buildStationDetail(stations[position]);
            },
            itemCount: stations.length,
          );
        },
      ),
    );
  }

  Widget _buildStationDetail(Station station) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                child: Text(
                  station.comune,
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                child: Text(
                  station.comune,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "5m",
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_border,
                    size: 35.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Divider(
        height: 2.0,
        color: Colors.grey,
      )
    ]);
  }
}
