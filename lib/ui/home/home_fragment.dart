import 'dart:math';

import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/ui/home/home_view_model.dart';
import 'package:benzapp_flutter/ui/qrcode/qrcode_screen.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_item_widget.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_list_screen.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_detail_screen.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_item_widget.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
            child: _buildVehiclesCard()),
        Divider(),
        Padding(
            padding: const EdgeInsets.only(top: 36, left: 8, right: 8),
            child: _buildRefuelingsCard()),
      ],
    );
  }

  Widget _buildVehiclesCard() {
    return Consumer<HomeViewModel>(
        builder: (BuildContext context, HomeViewModel viewModel,
                Widget? child) =>
            FutureBuilder<List<Vehicle>>(
                future: viewModel.getTessere(),
                initialData: const <Vehicle>[],
                builder: (BuildContext buildContext,
                        AsyncSnapshot<List<Vehicle>> snapshot) =>
                    Card(
                      elevation: 8,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context, int position) =>
                            position == 0
                                ? _buildVehicleTitle(snapshot.data!.length)
                                : VehicleItem(snapshot.data![position - 1],
                                    (Vehicle item) {
                                    Navigator.pushNamed(
                                      context,
                                VehicleDetailScreen.routeName,
                                arguments: ScreenArguments(
                                    id: item.id, title: item.targa),
                              );
                            }, (Vehicle item) {
                              Navigator.pushNamed(
                                context,
                                QRCodeScreen.routeName,
                                arguments: ScreenArguments(
                                    id: item.id, title: item.targa),
                              );
                            }),
                        itemCount: min(3, snapshot.data!.length + 1),
                      ),
                    )));
  }

  Widget _buildRefuelingsCard() {
    return Consumer<HomeViewModel>(
        builder: (BuildContext context, HomeViewModel viewModel,
                Widget? child) =>
            FutureBuilder<List<Refueling>>(
                future: viewModel.getRifornimenti(),
                initialData: const <Refueling>[],
                builder: (BuildContext buildContext,
                        AsyncSnapshot<List<Refueling>> snapshot) =>
                    Card(
                      elevation: 8,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context, int position) =>
                            position == 0
                                ? _buildRefuelingTitle(snapshot.data!.length)
                                : RefuelingItem(snapshot.data![position - 1]),
                        itemCount: min(3, snapshot.data!.length + 1),
                      ),
                    )));
  }

  Widget _buildRefuelingTitle(int size) {
    return ListTile(
        leading:
            const Icon(Icons.local_gas_station, color: Colors.indigo, size: 48),
        title: Text(
          'Rifornimenti',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.indigo),
        ),
        trailing: OutlinedButton(
          onPressed: () {
            debugPrint('Received click');
            Navigator.of(context).pushNamed(
              RefuelingListScreen.routeName,
              arguments: ScreenArguments(),
            );
          },
          child: Text(
            'VEDI TUTTI (${size})',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ));
  }

  Widget _buildVehicleTitle(int size) {
    return ListTile(
        leading: Icon(Icons.directions_car, color: Colors.indigo, size: 48),
        title: Text(
          'Tessere',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.indigo),
        ),
        trailing: OutlinedButton(
          onPressed: () {
            debugPrint('Received click');
            Navigator.of(context).pushNamed(VehicleListScreen.routeName);
          },
          child: Text(
            'VEDI TUTTE (${size})',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ));
  }
}
