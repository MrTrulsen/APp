import 'services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models/location_model.dart';

class LocationCoordinates{
  double lat;
  double lng;

  LocationCoordinates({
     this.lat,
     this.lng
  });
}

class MyMap extends StatefulWidget {

 final LocationCoordinates locationCoordinates;
 final String city;

 MyMap({this.locationCoordinates, this.city});

  @override
  State<MyMap> createState() => DirectionShowing();
}

class DirectionShowing extends State<MyMap> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.locationCoordinates.lat, widget.locationCoordinates.lng),
          zoom: 15,
        ),
        markers: {
          new Marker(markerId: MarkerId(widget.city), position: LatLng(widget.locationCoordinates.lat, widget.locationCoordinates.lng),
          infoWindow: InfoWindow(title: widget.city)),
        }
      ),
    );
  }
}


