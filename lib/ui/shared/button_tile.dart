import 'dart:math';

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonTile extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const ButtonTile({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        color: Constants.black2dp,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "المحادثة",
              style: Constants.mediumText,
            ),
            Transform.rotate(
              angle: pi,
              child: Icon(Icons.arrow_back_ios),
            ),
          ],
        ),
      ),
    );
  }
}
