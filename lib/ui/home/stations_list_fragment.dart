import 'dart:convert';

import 'package:benzapp_flutter/repositories/model/marchio.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/viewmodels/station_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationsListFragment extends StatelessWidget {
  const StationsListFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Consumer<StationsViewModel>(
            builder: (BuildContext context, StationsViewModel stationModel, Widget? child) =>
                FutureBuilder<List<Station>>(
                  future: stationModel.loadData(),
                  initialData: const <Station>[],
                  builder: (BuildContext buildContext, AsyncSnapshot<List<Station>> snapshot) => ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int position) => _buildStationDetail(snapshot.data![position]),
                    itemCount: snapshot.data!.length,
                  ),
                )));
  }

  Widget _buildStationDetail(Station station) {
    return ListTile(
      title: Text(station.indirizzo),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          station.comune,
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
      leading: Marchio.values[station.marchioId].image,
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

  Container _showInfo(String label, String price) =>
      Container(padding: EdgeInsetsDirectional.all(8), child: Column(children: [Text(label), Text('${price} €/L')]));

  Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      width: 72,
      height: 72,
    );
  }

// Widget _buildStationDetail(Station station) {
//   return Expanded(child: Column(children: <Widget>[
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
//               child: Flexible(
//                 child: Text(
//                   station.indirizzo,
//                   style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
//               child: Text(
//                 station.comune,
//                 style: const TextStyle(fontSize: 18.0),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: const <Widget>[
//               Text(
//                 "5m",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(
//                   Icons.star_border,
//                   size: 35.0,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     const Divider(
//       height: 2.0,
//       color: Colors.grey,
//     )
//   ]));
// }
}
