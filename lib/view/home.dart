import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String message = "This is a sample distress message from Kaustubh";

    List<String> recipents = ["9922450488", "8080223251"];

    void _sendSMS(String message, List<String> recipents) async {
      String _result = await sendSMS(message: message, recipients: recipents)
          .catchError((onError) {
        return onError.toString();
      });
      print(_result);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ClipOval(
            child: Material(
              color: Colors.red,
              child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    _sendSMS(message, recipents);
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
