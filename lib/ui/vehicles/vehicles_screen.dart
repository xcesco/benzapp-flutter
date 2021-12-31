import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/ui/home/home_view_model.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  static const String routeName = '/vehicles';

  @override
  State<StatefulWidget> createState() {
    return VehicleScreenState();
  }
}

class VehicleScreenState extends State<VehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Elenco tessere'),
        ),
        body: Container(
            color: Colors.white,
            child: Consumer<HomeViewModel>(
                builder: (BuildContext context, HomeViewModel viewModel, Widget? child) =>
                    FutureBuilder<List<Vehicle>>(
                      future: viewModel.getTessere(),
                      initialData: const <Vehicle>[],
                      builder: (BuildContext buildContext, AsyncSnapshot<List<Vehicle>> snapshot) =>
                          ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => const Divider(
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context, int position) => VehicleItem(snapshot.data![position]),
                        itemCount: snapshot.data!.length,
                      ),
                    ))));
  }
}
