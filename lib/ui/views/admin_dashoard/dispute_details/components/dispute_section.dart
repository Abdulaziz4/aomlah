import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class DisputeSection extends StatelessWidget {
  final String title;
  final Widget content;

  const DisputeSection({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Constants.largeText.copyWith(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        content,
      ],
    );
  }
}
