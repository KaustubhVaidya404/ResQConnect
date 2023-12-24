import 'package:geolocator/geolocator.dart';
//import 'package:geocoding/geocoding.dart';
//import 'package:flutter/material.dart';

class LocationService {
  Future<Position> determineCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      print('Location service is not enabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      print('Location service is not enabled');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }
}
