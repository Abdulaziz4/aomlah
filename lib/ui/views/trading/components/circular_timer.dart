import 'package:aomlah/core/app/utils/constants.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CircularTimer extends StatelessWidget {
  final Duration endTime;
  const CircularTimer({Key? key, required this.endTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
      ),
      child: CircularCountDownTimer(
        duration: endTime.inSeconds,
        initialDuration: 0,
        width: 44,
        height: 44,
        controller: CountDownController(),
        ringColor: Colors.grey[300]!,
        fillColor: Constants.darkBlue,
        fillGradient: null,
        backgroundGradient: null,
        strokeWidth: 5.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
          fontSize: 13.0,
          color: Constants.darkBlue,
          fontWeight: FontWeight.bold,
        ),
        textFormat: CountdownTextFormat.MM_SS,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
      ),
    );
  }
}
