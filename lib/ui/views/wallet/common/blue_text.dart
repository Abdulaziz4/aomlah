import 'package:flutter/material.dart';

import '../../../../core/app/utils/constants.dart';

class BlueText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const BlueText({
    required this.text,
    required this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Constants.robotoFont.copyWith(color: Constants.darkBlue),
    );
  }
}
