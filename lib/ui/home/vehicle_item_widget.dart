import 'dart:convert';

import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleItem extends StatelessWidget {
  final Vehicle _item;
  //final Function _onItemSelected;

  const VehicleItem(this._item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
     // onTap: _onItemSelected,
      contentPadding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      leading: _buildImage(_item),
      title: Text(
        _item.targa,
        style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ..._buildDelega(_item),
          GestureDetector(
            child: const Icon(
              Icons.qr_code,
              color: Colors.indigoAccent,
            ),
            onTap: () {
              AppDebug.log('QRCORDE');
            },
          ),
          GestureDetector(
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.indigoAccent,
            ),
            onTap: () {
              AppDebug.log('DETAIL');
            },
          ),
        ],
      ),
    );
  }

  Image imageFromBase64String(String base64String, {double size = 72, boxFit: BoxFit.fitWidth}) {
    return Image.memory(base64Decode(base64String), width: size, height: size, fit: boxFit);
  }

  Widget _buildImage(Vehicle item) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 32.0,
      child: CircleAvatar(
        backgroundImage: imageFromBase64String(_item.immagine, size: 16, boxFit: BoxFit.scaleDown).image,
        radius: 31.0,
      ),
    );
  }

  List<Widget> _buildDelega(Vehicle item) {
    if (_item.delega) {
      return <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 14),
          child: const Chip(
            label: Text(
              'delega',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigoAccent,
          ),
        )
      ];
    } else {
      return [];
    }
  }
}
