import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BusyOverlay extends StatefulWidget {
  final bool isBusy;
  final Widget child;
  const BusyOverlay({Key? key, required this.isBusy, required this.child})
      : super(key: key);

  @override
  _BusyOverlayState createState() => _BusyOverlayState();
}

class _BusyOverlayState extends State<BusyOverlay> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isBusy) return widget.child;
    return Stack(
      children: [
        widget.child,
        Opacity(
          child: ModalBarrier(dismissible: false, color: Colors.black45),
          opacity: 0.5,
        ),
        Center(
          child: SpinKitWave(
            color: Constants.primaryColor,
            type: SpinKitWaveType.start,
          ),
        ),
      ],
    );
  }
}
