import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => DirectionShowing();
}

class DirectionShowing extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(62.472229, 6.149482),
          zoom: 11,
        ),
      ),
    );
  }
}
