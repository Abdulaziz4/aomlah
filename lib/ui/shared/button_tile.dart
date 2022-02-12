import 'dart:math';

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonTile extends StatelessWidget {
  final String text;
  Color? color;
  Widget? widget;
  final void Function() onPressed;
  ButtonTile({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    color ??=Colors.white;
    widget ??= Transform.rotate(
      angle: pi,
      child: Icon(Icons.arrow_back_ios,color: color),
    );
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        color: Constants.black2dp,
        margin: const EdgeInsets.symmetric(vertical: 0),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.cairo().copyWith(
                fontSize: 19,
                color: color
              ),


            ),
            widget as Widget,

          ],
        ),
      ),
    );
  }
}