import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WalletButton extends StatelessWidget {
  final void Function() onPressed;
  final String cryptoType;
  final double balance;
  final String image;
  final Color? color;
  final TextStyle? textStyle;
  final double? height;
  final double? width;

  const WalletButton({
    required this.onPressed,
    required this.cryptoType,
    this.height,
    this.textStyle,
    this.width,
    this.color,
    Key? key,
    required this.balance,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          color: Constants.black3dp,
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Image.asset(
                image,
                width: 25,
              ),
              Container(width: 10),
              textCrypto(
                cryptoType,
                style: textStyle,
              ),
              Spacer(flex: 3),
              Text(
                cryptoType.toUpperCase(),
                style: textStyle,
              ),
              Text(
                ' $balance  ',
                style: textStyle,
              ),
              SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
            ],
          ),
        ));
  }
}

Text textCrypto(String cryptoType, {TextStyle? style}) {
  String cText = '';
  if (cryptoType.toUpperCase() == 'BTC') {
    cText = ' بتكوين ';
  } else if (cryptoType.toUpperCase() == 'ETH') {
    cText = ' اثيريوم ';
  } else if (cryptoType.toUpperCase() == 'USDT') {
    cText = ' دولار تيذر ';
  } else if (cryptoType.toUpperCase() == 'UNI') {
    cText = ' يوني سواب ';
  } else if (cryptoType.toUpperCase() == 'BAT') {
    cText = ' بيسك اتنشن ';
  }
  return Text(
    ' $cText ( $cryptoType )',
    style: style,
  );
}
