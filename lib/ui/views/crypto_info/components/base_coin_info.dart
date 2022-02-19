import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:flutter/material.dart';

class BaseCoinInfo extends StatelessWidget {
  final Coin coin;
  const BaseCoinInfo({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: [
            Container(width: 5),
            Text(
              coin.price,
              style: Constants.mediumText,
            ),
            Text(
              coin.change24hr + "%",
              style: TextStyle(
                color: coin.change24hr.startsWith("+")
                    ? Constants.primaryColor
                    : Colors.red,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              coin.fullName,
              style: Constants.mediumText.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(coin.name),
          ],
        ),
        Container(width: 5),
        Image.network(
          coin.getFullLogoUrl(),
          height: 50,
          width: 50,
        ),
      ],
    );
  }
}
