import 'package:flutter/material.dart';

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
              //TODO: Add onTap for the button
              onTap: () {debugPrint("Button tapped");},
              child: const SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    "ResQConnect",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ),
          ),
        ),
      )
    );
  }
}
