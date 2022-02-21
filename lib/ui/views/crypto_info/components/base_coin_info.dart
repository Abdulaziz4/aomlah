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
    print(coin.change24hr.startsWith("+"));
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            Image.network(
              coin.getFullLogoUrl(),
              height: 50,
              width: 50,
            ),
            Container(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            Spacer(),
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
                    color: coin.change24hr.startsWith("-")
                        ? Colors.red
                        : Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
