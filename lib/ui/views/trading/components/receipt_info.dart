import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class RecipteInfoItem extends StatelessWidget {
  final String rightText;
  final String leftText;
  const RecipteInfoItem({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rightText,
          style: Constants.mediumText.copyWith(
            color: Constants.darkBlue,
          ),
        ),
        Text(
          leftText,
          style: Constants.mediumText,
        ),
      ],
    );
  }
}
