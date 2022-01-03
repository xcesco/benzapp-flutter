import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_detail_screen.dart';
import 'package:benzapp_flutter/ui/widgets/app_commons.dart';
import 'package:flutter/material.dart';
import 'package:instant/instant.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class RefuelingItem extends StatelessWidget {
  final Refueling _item;

  const RefuelingItem(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _onSelect(context);
      },
      contentPadding:
          const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      leading: createRefuelingAvatar(context, _item.tipoCarburante.name),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          _item.targa,
          style: const TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
        Text(
          DateFormat('dd MMM yyyy, kk:mm', 'IT_it')
              .format(dateTimeToZone(zone: "CEST", datetime: _item.data)),
          style: const TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.bold),
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
                    ((_item.prezzoAlLitro - _item.sconto) * _item.litriErogati)
                        .toStringAsFixed(2),
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
          _onSelect(context);
          AppDebug.log('DETAIL');
        },
      ),
    );
  }

  void _onSelect(BuildContext context) {
    Navigator.pushNamed(context, RefuelingDetailScreen.routeName,
        arguments: ScreenArguments(id: _item.id, title: _item.targa));
  }
}
