import 'package:flutter/material.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Aomlah",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
