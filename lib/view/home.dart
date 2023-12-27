import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:res_q_connect/functions/get_location_function.dart';
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
