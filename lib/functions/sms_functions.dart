import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:res_q_connect/functions/make_call_function.dart';

List<String> recipents = [
  "9922450488",
  "9767030005",
  "8080223251",
  "9405912557"
];

smsFunction(Position position) async {
  SmsStatus result = await BackgroundSms.sendMessage(
      phoneNumber: recipents[2],
      message:
          "Please follow the link to reach the distress signal https://www.google.com/maps?saddr=My+Location&daddr=${position.latitude},${position.longitude}");
  if (result == SmsStatus.sent) {
    debugPrint('object send');
    makeCall();
  } else {
    debugPrint('error');
  }
}
