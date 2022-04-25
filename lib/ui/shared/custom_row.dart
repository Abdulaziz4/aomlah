import 'package:flutter/cupertino.dart';

import '../../core/app/utils/constants.dart';

class CusRow extends StatelessWidget {
  final String text1;
  final String text2;
  final String? cryptoTypeID;
  const CusRow({
    Key? key,
    required this.text1,
    required this.text2,
    this.cryptoTypeID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cryptoAmonutLabel() {
      return "ㅤ" + cryptoTypeID! + "";
    }

    String? text3;

    if (cryptoTypeID != null) text3 = cryptoAmonutLabel();
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
            '' + text2 + (text3 ?? '') + '',
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
