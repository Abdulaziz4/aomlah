import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class SpannedTextItem extends StatelessWidget {
  final String rightText;
  final String leftText;

  const SpannedTextItem(
      {Key? key, required this.leftText, required this.rightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rightText,
          style: Constants.mediumText.copyWith(
            color: Constants.darkBlue,
          ),
        ),
        SizedBox(width: 5),
        Text(
          leftText,
          style: Constants.mediumText,
        ),
      ],
    );
  }
}
