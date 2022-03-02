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
    return Stack(
      children: [
        widget.child,
        if (widget.isBusy)
          Opacity(
            child: ModalBarrier(dismissible: false, color: Colors.black45),
            opacity: 0.5,
          ),
        if (widget.isBusy)
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
