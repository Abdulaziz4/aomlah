import 'package:flutter/material.dart';

class PredictionView extends StatelessWidget {
  const PredictionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/prediction-bg.png"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Text("Prediction ...."),
      ),
    );
  }
}
