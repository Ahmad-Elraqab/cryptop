import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class GMap extends StatefulWidget {
  GoogleMapController? controller;
  final Map<MarkerId, Marker>? markers;
  final String? id;
  final Function? onChange;
  final Function? setController;
  final Function? setCenter;

  GMap(
      {Key? key,
      this.markers,
      this.id,
      this.onChange,
      this.setCenter,
      this.controller,
      this.setController})
      : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  void _onMapCreated(GoogleMapController controller) {
    widget.setController!(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        markers: Set<Marker>.of(widget.markers!.values),
        onMapCreated: _onMapCreated,
        onCameraMove: (position) => widget.setCenter!(position.target),
        initialCameraPosition: CameraPosition(
          target: widget.markers![MarkerId(widget.id!)]!.position,
          zoom: 7.0,
        ),
      ),
    );
  }
}
