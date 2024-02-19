import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

Future<String?> getCountryFromPosition(
    double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      String? country = placemarks[0].country;
      debugPrint('country: $country');
    } else {
      debugPrint('No country found');
    }
    return placemarks[0].country;
  } catch (e) {
    debugPrint(e.toString());
  }
}
