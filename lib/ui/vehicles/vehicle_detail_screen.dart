import 'dart:convert';

import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/model/vehicle_status.dart';
import 'package:benzapp_flutter/repositories/model/vehicle_summary.dart';
import 'package:benzapp_flutter/repositories/network/model/cittadino.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_list_screen.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_view_model.dart';
import 'package:benzapp_flutter/ui/widgets/app_commons.dart';
import 'package:benzapp_flutter/ui/widgets/please_wait_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../main.dart';

class VehicleDetailScreen extends StatefulWidget {
  const VehicleDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/vehicleDetail';

  @override
  State<StatefulWidget> createState() {
    return VehicleDetailState();
  }
}

class VehicleDetailState extends State<VehicleDetailScreen> {
  late Vehicle _vehicle;

  late VehicleSummary _summary;

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Consumer<VehicleViewModel>(
      builder: (BuildContext context, VehicleViewModel viewModel,
              Widget? child) =>
          Scaffold(
              appBar: AppBar(
                title: Text('${localization.detail} ${args.title}'),
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.local_gas_station_rounded),
                      tooltip: localization.refuelings,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RefuelingListScreen.routeName,
                          arguments: ScreenArguments(
                              id: _vehicle.id, title: _vehicle.targa),
                        );
                      }),
                ],
              ),
              body: Container(
                  color: Colors.white,
                  child: FutureBuilder<VehicleStatus?>(
                      future: viewModel.loadStatusByTarga(args.title!),
                      initialData: null,
                      builder: (BuildContext buildContext,
                          AsyncSnapshot<VehicleStatus?> snapshot) {
                        if (snapshot.hasData) {
                          _vehicle = snapshot.data!.tessera;
                          _summary = snapshot.data!.summary;
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  createVehicleAvatar(_vehicle, size: 76),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 4, right: 4),
                                              child: buildText(
                                                  localization.codice,
                                                  _vehicle.codice))),
                                      Expanded(
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 4, right: 4),
                                              child: buildText(
                                                localization.issueDate,
                                                DateFormat(
                                                        'dd MMM yyyy', 'IT_it')
                                                    .format(
                                                        _vehicle.dataEmissione),
                                              ))),
                                    ],
                                  ),
                                  buildText(localization.targa, _vehicle.targa),
                                  buildText(localization.owner,
                                      _buildOwnerTitle(_vehicle.cittadino)),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: createRefuelingAvatar(
                                                context,
                                                _vehicle.carburante.name,
                                                size: 48)),
                                        Expanded(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                              buildText(localization.pagato,
                                                  '${_summary.spesa.toStringAsFixed(2)} €',
                                                  icon: Icons.euro),
                                              buildText(
                                                  localization
                                                      .contributoRegionale,
                                                  '${_summary.risparmio.toStringAsFixed(2)} €',
                                                  icon: Icons.savings),
                                              buildText(
                                                  localization.litriErogati,
                                                  '${_summary.litriErogati.toStringAsFixed(2)} L.',
                                                  icon: Icons
                                                      .local_gas_station_rounded),
                                            ])),
                                      ]),
                                ],
                              ));
                        } else {
                          return const PleaseWait();
                        }
                      }))),
    );
  }

  Widget buildText(String label, String value, {IconData? icon}) {
    return TextFormField(
      autofocus: false,
      readOnly: true,
      initialValue: value,
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.indigo,
        ),
      ),
    );
  }

  String _buildOwnerTitle(Cittadino cittadino) =>
      "${cittadino.nome} ${cittadino.cognome} (${cittadino.codiceFiscale})";
}
