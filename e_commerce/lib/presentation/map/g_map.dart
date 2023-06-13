import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  static const String routeName = 'gmap';
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const LatLng src = LatLng(30, 31);

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final Set<Marker> markers = <Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: src,
            zoom: 10,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: markers),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: FloatingActionButton(
          onPressed: () {
            getUserCurrentLocation().then((value) {
              print(
                  "latitude ${value.latitude.toString()} and longitude is ${value.longitude.toString()}");
              markers.add(Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(title: "My current location")));
              CameraPosition camPosition = CameraPosition(
                  zoom: 15, target: LatLng(value.latitude, value.longitude));
              navigateToCurrentLocation(camPosition);
              setState(() {});
            });
          },
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error ${error.toString()}");
    });
    return Geolocator.getCurrentPosition();
  }

  Future<void> navigateToCurrentLocation(CameraPosition camPosition) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(camPosition));
  }
}
