import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:res_q_connect/functions/get_country_location.dart';
import 'package:res_q_connect/functions/make_call_function.dart';
import 'package:res_q_connect/data/policedata.dart';

smsFunction(Position position) async {
  String? country =
      await getCountryFromPosition(position.latitude, position.longitude);
  var countryKey = emergencyPoliceNumbers.entries.firstWhere(
      (element) => element.key == country,
      orElse: () => const MapEntry<String, String>("null", "null"));
  SmsStatus result = await BackgroundSms.sendMessage(
      phoneNumber: countryKey.value,
      message:
          "Please follow the link to reach the distress signal https://www.google.com/maps?saddr=My+Location&daddr=${position.latitude},${position.longitude}");
  if (result == SmsStatus.sent) {
    debugPrint('object send');
    makeCall(country!);
  } else {
    debugPrint('error');
  }
}
