import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/ui/stations/place.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationsMap extends StatefulWidget {
  final List<Station> _stations;

  const StationsMap(this._stations, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StationMapState();
  }
}

class StationMapState extends State<StationsMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late ClusterManager<Place> _manager;
  Set<Marker> markers = {};

  @override
  void initState() {
    _manager = ClusterManager<Place>([], _updateMarkers, markerBuilder: _markerBuilder);

    super.initState();
  }

  @override
  void didUpdateWidget(StationsMap oldWidget) {
    _manager.setItems(widget._stations
        .map((Station station) => Place(name: station.comune, latLng: LatLng(station.latitudine, station.longitudine)))
        .toList());
  }

  void _updateMarkers(Set<Marker> markers) {
    AppDebug.log('Updated ${markers.length} markers');

    setState(() {
      this.markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder => (Cluster<Place> cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            cluster.items.forEach((Place p) => print(p));
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
      final TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(fontSize: size / 3, color: Colors.white, fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final Image img = await pictureRecorder.endRecording().toImage(size, size);
    final ByteData data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
