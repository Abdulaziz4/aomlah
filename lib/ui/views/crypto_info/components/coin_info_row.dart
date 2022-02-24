import 'package:aomlah/core/app/utils/colors_helper.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class CoinInfoRow extends StatelessWidget {
  final String field;
  final String fieldValue;
  final TextDirection? textDirection;
  const CoinInfoRow({
    Key? key,
    required this.field,
    required this.fieldValue,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: brighten(Constants.black2dp, 1),
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xff3D4955),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            field,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Text(
            fieldValue,
            textDirection: textDirection ?? TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
