import 'dart:convert';

import 'package:benzapp_flutter/ui/qrcode/qrcode_data.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_view_model.dart';
import 'package:benzapp_flutter/ui/widgets/please_wait_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../main.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  static const String routeName = '/qrcode';

  @override
  State<StatefulWidget> createState() {
    return QRCodeScreenState();
  }
}

class QRCodeScreenState extends State<QRCodeScreen> {
  late QRCodeData qrcodeData;

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
                title: Text('${localization.qrCodeTitle} ${args.title}'),
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.share),
                      tooltip: 'Share QRCode',
                      onPressed: () {
                        viewModel.shareQRCode(qrcodeData);
                      }),
                ],
              ),
              body: Container(
                  color: Colors.white,
                  child: FutureBuilder<QRCodeData?>(
                      future: viewModel.loadQRCode(args.title!),
                      initialData: null,
                      builder: (BuildContext buildContext,
                          AsyncSnapshot<QRCodeData?> snapshot) {
                        if (snapshot.hasData) {
                          qrcodeData = snapshot.data!;
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 8),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: QrImage(
                                        data: jsonEncode(qrcodeData.toJson()),
                                        version: QrVersions.auto,
                                        size: 400.0,
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${localization.targa}: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                      Text(qrcodeData.targa,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(color: Colors.indigo))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${localization.numeroTessera}: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                      Text(qrcodeData.tesseraNumero,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(color: Colors.indigo))
                                    ],
                                  ),
                                ],
                              ));
                        } else {
                          return const PleaseWait();
                        }
                      }))),
    );
  }
}
