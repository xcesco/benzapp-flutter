import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_view_model.dart';
import 'package:benzapp_flutter/ui/widgets/app_commons.dart';
import 'package:benzapp_flutter/ui/widgets/please_wait_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class RefuelingDetailScreen extends StatefulWidget {
  const RefuelingDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/refuelingDetail';

  @override
  State<StatefulWidget> createState() {
    return RefuelingDetailState();
  }
}

class RefuelingDetailState extends State<RefuelingDetailScreen> {
  late Tessera _vehicle;
  late Refueling _refueling;

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Consumer<RefuelingViewModel>(
      builder: (BuildContext context, RefuelingViewModel viewModel,
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
                          RefuelingDetailScreen.routeName,
                          arguments: ScreenArguments(
                              id: _vehicle.id, title: _vehicle.targa),
                        );
                      }),
                ],
              ),
              body: Container(
                  color: Colors.white,
                  child: FutureBuilder<Refueling?>(
                      future: viewModel.loadDataById(args.id!),
                      initialData: null,
                      builder: (BuildContext buildContext,
                          AsyncSnapshot<Refueling?> snapshot) {
                        if (snapshot.hasData) {
                          _vehicle = snapshot.data!.tessera;
                          _refueling = snapshot.data!;
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  createRefuelingAvatar(
                                      context, _vehicle.carburante!.name,
                                      size: 48),
                                  buildText(
                                    localization.date,
                                    DateFormat('dd MMM yyyy', 'IT_it')
                                        .format(_refueling.data),
                                  ),
                                  buildText(
                                      localization.targa, _vehicle.targa!),
                                  buildText(localization.station,
                                      '${_refueling.gestore.indirizzo}, ${_refueling.gestore.comune}'),
                                  buildText(localization.pagato,
                                      '${_importoPagato(_refueling)} €',
                                      icon: Icons.euro),
                                  buildText(localization.litriErogati,
                                      '${_refueling.litriErogati.toStringAsFixed(2)} L.',
                                      icon: Icons.local_gas_station_rounded),
                                  buildText(localization.contributoRegionale,
                                      '${(_refueling.sconto * _refueling.litriErogati).toStringAsFixed(2)} €',
                                      icon: Icons.savings),
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

  String _importoPagato(Refueling refueling) {
    return (refueling.litriErogati *
            (refueling.prezzoAlLitro - refueling.sconto))
        .toStringAsFixed(2);
  }
}
