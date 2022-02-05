import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final double? height;
  final double? width;

  const CustomButton({
    required this.onPressed,
    required this.text,
    this.height,
    this.textStyle,
    this.width,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 120, height ?? 35),
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            7,
          ), // <-- Radius
        ),
        elevation: 3,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ??
            Constants.smallText.copyWith(
              color: Colors.grey[200],
            ),
      ),
    );
  }
}
