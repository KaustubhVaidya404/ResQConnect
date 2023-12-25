import 'package:flutter/material.dart';
import 'package:background_sms/background_sms.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String message = "This is a sample distress message from Kaustubh";

    List<String> recipents = [
      "9922450488",
      "9767030005",
      "8080223251",
      "9405912557"
    ];

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
                    if (await Permission.sms.isGranted) {
                      //smsFunction(message: message, number: recipents);
                      SmsStatus result = await BackgroundSms.sendMessage(
                          phoneNumber: recipents[2], message: message);
                      if (result == SmsStatus.sent) {
                        print('object send');
                      } else {
                        print('error');
                      }
                    } else {
                      final status = await Permission.sms.request();
                      if (status.isGranted) {
                        //smsFunction(message: message, number: recipents);
                        SmsStatus result = await BackgroundSms.sendMessage(
                            phoneNumber: recipents[1], message: message);
                        if (result == SmsStatus.sent) {
                          print('object send');
                        } else {
                          print('error');
                        }
                      }
                    }
                    // smsFunction(message: message, number: recipents);
                    print('object send');
                  },
                  child: const SizedBox(
                    width: 200,
                    height: 200,
                    child: Center(
                      child: Text(
                        "ResQConnect",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  )),
            ),
          ),
        ));
  }
}
