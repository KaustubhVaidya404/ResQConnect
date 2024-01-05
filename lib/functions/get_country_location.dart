import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

void getCountryFromPosition(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks != null && placemarks.isNotEmpty) {
      String? country = placemarks[0].country;
      debugPrint('country: $country');
    } else {
      debugPrint('No country found');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
