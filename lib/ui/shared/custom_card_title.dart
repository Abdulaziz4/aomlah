import 'package:flutter/material.dart';

class CusCardTitle extends StatelessWidget {
  final String title;
  const CusCardTitle({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 20),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
