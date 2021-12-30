import 'package:benzapp_flutter/repositories/model/marchio.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:flutter/material.dart';

class StationItem extends StatelessWidget {
  final Station _station;

  const StationItem(this._station);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_station.indirizzo),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          _station.comune,
          textAlign: TextAlign.start,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _showInfo('Benzina', '1.34'),
            _showInfo('Gasolio', '1.56'),
          ],
        )
      ]),
      leading: Marchio.values[_station.marchioId].image,
      isThreeLine: true,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: const Icon(
              Icons.directions,
              color: Colors.blue,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Container _showInfo(String label, String price) => Container(
      padding: const EdgeInsetsDirectional.all(8), child: Column(children: [Text(label), Text('$price €/L')]));
}
