import 'dart:convert';


import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showInSnackBar(BuildContext context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(value),
  ));
}

Future<void> showInformationDialog(BuildContext context, String message) async {
  final AppLocalizations localization = AppLocalizations.of(context)!;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(localization.information),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(localization.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget createVehicleAvatar(Vehicle item, {final double size = 32}) {
  return CircleAvatar(
    backgroundColor: Colors.grey,
    radius: size,
    child: CircleAvatar(
      backgroundImage: createImageFromBase64String(item.immagine,
              size: size / 2, boxFit: BoxFit.scaleDown)
          .image,
      radius: size - 1,
    ),
  );
}

Widget createRefuelingAvatar(BuildContext context, String tipoCarburante,
    {final double size = 32}) {
  return CircleAvatar(
    backgroundColor: Colors.grey,
    radius: size,
    child: CircleAvatar(
      child: Text(
        tipoCarburante,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.apply(fontSizeFactor: 0.6, color: Colors.white),
      ),
      radius: size - 1,
      backgroundColor:
          tipoCarburante == 'BENZINA' ? Colors.green : Colors.black54,
    ),
  );
}

Image createImageFromBase64String(String base64String,
    {double size = 72, boxFit: BoxFit.fitWidth}) {
  return Image.memory(base64Decode(base64String),
      width: size, height: size, fit: boxFit);
}
