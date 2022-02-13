import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class BankAccountItem extends StatelessWidget {
  final String bankName;
  const BankAccountItem({
    Key? key,
    required this.bankName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = (Constants.randomizeColors.toList()..shuffle()).first;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 3,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        SizedBox(width: 5),
        Text(
          bankName,
          style: Constants.smallText,
        ),
      ],
    );
  }
}