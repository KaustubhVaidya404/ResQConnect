import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:res_q_connect/functions/get_location_function.dart';
import 'package:res_q_connect/functions/make_call_function.dart';
import 'package:res_q_connect/widget/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                      makeCall();
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
