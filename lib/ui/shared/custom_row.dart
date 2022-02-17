import 'package:flutter/cupertino.dart';

import '../../core/app/utils/constants.dart';

class CusRow extends StatelessWidget {
  final String text1;
  final String text2;
  const CusRow({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            textAlign: TextAlign.right,
            style: TextStyle(color: Constants.darkBlue),
          ),
          Text(
            text2,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
