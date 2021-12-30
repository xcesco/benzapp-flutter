import 'dart:convert';

import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RefuelingItem extends StatelessWidget {
  final Refueling _item;

  const RefuelingItem(this._item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: _onItemSelected,
      contentPadding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      leading: _buildType(_item),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          _item.targa,
          style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
        Text(
          DateFormat('dd MMM yyyy, kk:mm').format(_item.data),
          style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
      ]),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_item.gestore.indirizzo}, ${_item.gestore.comune}',
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.euro,
                    color: Colors.grey,
                  ),
                  Text(
                    (_item.prezzoAlLitro * _item.litriErogati).toStringAsFixed(2),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.local_gas_station,
                        color: Colors.grey,
                      )),
                  Text(
                    '${_item.litriErogati.toStringAsFixed(2)} L.',
                  ),
                ],
              ))
        ],
      ),
      trailing: GestureDetector(
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.indigo,
        ),
        onTap: () {
          AppDebug.log('DETAIL');
        },
      ),
    );
  }

  Image imageFromBase64String(String base64String, {double size = 72, boxFit: BoxFit.fitWidth}) {
    return Image.memory(base64Decode(base64String), width: size, height: size, fit: boxFit);
  }

  Widget _buildType(Refueling item) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 32.0,
      child: CircleAvatar(
        child: Text(
          _item.tipoCarburante.name,
          style: TextStyle(color: Colors.white),
        ),
        radius: 31.0,
        backgroundColor: item.tipoCarburante == 'BENZINA' ? Colors.green : Colors.black54,
      ),
    );
  }
}
