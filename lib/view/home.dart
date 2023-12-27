import 'package:flutter/material.dart';
import 'package:background_sms/background_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:res_q_connect/utilities/fetch_location.dart';
import 'package:res_q_connect/widget/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              "This is a sample distress message from Kaustubh at location ${position.latitude}, ${position.longitude}");
      if (result == SmsStatus.sent) {
        debugPrint('object send');
      } else {
        debugPrint('error');
      }
    }

    // Location Permission
    Future<void> getCurrentLocation() async {
      final hasPermission = await Permission.location.isGranted;
      if (hasPermission) {
        await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best)
            .then((Position position) {
          debugPrint('location generated @ $position');
          smsFunction(position);
        }).catchError((e) {
          debugPrint(e);
        });
      }
    }

    // Future smsFunction({required message, required number}) async {
    //   SmsStatus response = await BackgroundSms.sendMessage(
    //       phoneNumber: number, message: message);
    //   return response;
    // }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ClipOval(
            child: Material(
              color: Colors.red,
              child: InkWell(
                  splashColor: Colors.white,
                  onTap: () async {
                    if (await Permission.sms.isGranted &&
                        await Permission.location.isGranted) {
                      getCurrentLocation();
                    } else {
                      final smsStatus = await Permission.sms.request();
                      final locationStatus =
                          await Permission.location.request();
                      await Permission.location.request();
                      if (smsStatus.isGranted && locationStatus.isGranted) {
                        getCurrentLocation();
                      }
                    }
                  },
                  child: const CustomButtonWidget()),
            ),
          ),
        ));
  }
}
