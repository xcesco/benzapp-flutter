import 'dart:async';
import 'dart:ui';

import 'package:benzapp_flutter/maps/place.dart';
import 'package:benzapp_flutter/viewmodels/station_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class StationsMapFragment extends StatefulWidget {
  const StationsMapFragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StationsMapFragmentState();
  }
}

class _StationsMapFragmentState extends State<StationsMapFragment> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMap googleMap;
  late ClusterManager _manager;
  Set<Marker> markers = {};
  List<Place> items = [];
  bool alreadyBuild = false;

  @override
  void initState() {
    _manager = _initClusterManager();

    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  Widget buildMap(BuildContext context) {
    return Consumer<StationsViewModel>(
      builder: (context, stationModel, child) {
        print('buildMap with ${stationModel.stations.length}');

        if (_manager.items.isEmpty) {
          _manager.setItems(stationModel.stations
              .map((station) => Place(
                  name: station.comune,
                  latLng: LatLng(station.latitudine, station.longitudine)))
              .toList());
        }

        return GoogleMap(
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _manager.setMapId(controller.mapId);
            },
            onCameraMove: _manager.onCameraMove,
            onCameraIdle: _manager.updateMap,
            zoomControlsEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(45.909298, 12.543273),
              zoom: 11.0,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildMap(context);
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            cluster.items.forEach((p) => print(p));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.red;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

// var values = stations
//     .map((item) => Marker(
//         position: LatLng(item.latitudine, item.longitudine),
//         icon: BitmapDescriptor.defaultMarker,
//         markerId: MarkerId(item.id),
//         infoWindow:
//             InfoWindow(title: item.comune, snippet: item.indirizzo)))
//     .toSet();

// return stations.map((item) => Place(name: item.comune, latLng: LatLng(item.latitudine, item.longitudine))).toSet();

//  _updateMarkers(values);
}
