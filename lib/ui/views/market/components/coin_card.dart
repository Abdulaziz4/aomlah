import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/ui/views/crypto_info/crypto_info_view.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;
  const CoinCard({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CryptoInfoView()));
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff0F1E2C),
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color(0xff3D4955),
              ),
            )),
        child: Row(
          children: <Widget>[
            // Image.network(imagePath),
            Container(width: 12),
            Column(
              children: [
                Text(
                  coin.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  coin.fullName,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(flex: 2),
            Text(coin.change24hr),
            Spacer(flex: 2),
            Column(
              children: <Widget>[
                Text(coin.price),
                Text(
                  coin.circulationSupplay,
                  style: TextStyle(
                    color: Color(0xff16A79E),
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
