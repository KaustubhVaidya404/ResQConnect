import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 200,
      child: Center(
        child: Text(
          "ResQConnect",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
