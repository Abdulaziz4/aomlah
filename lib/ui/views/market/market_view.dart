import 'package:aomlah/ui/views/crypto_info/crypto_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("سوق العملات"),
        ),
        body: Column(
          children: <Widget>[
            Container(height: 10),
            Container(
              padding: EdgeInsets.all(5),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "اسم العملة",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "إجمالي التداول",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "السعر",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            crypto_info(
              imagePath: "assets/icons/Group 6.svg",
              shortName: "BTC",
              fullName: "Bitcoin",
              totalTrade: "\$212.24B",
              price: "\$212,333.24",
              precentage: "% 4.59 +",
            ),
            crypto_info(
              imagePath: "assets/icons/Group 4.svg",
              shortName: "ETH",
              fullName: "Ethereum",
              totalTrade: "\$138.03B",
              price: "\$13,438.03",
              precentage: "% 1.07 +",
            ),
            crypto_info(
              imagePath: "assets/icons/Group 8.svg",
              shortName: "BNB",
              fullName: "biance Coin",
              totalTrade: "\$38.88B",
              price: "\$2,838.88",
              precentage: "% 0.97 +",
            ),
          ],
        ));
  }
}

class crypto_info extends StatelessWidget {
  final String imagePath;
  final String shortName;
  final String fullName;
  final String totalTrade;
  final String price;
  final String precentage;

  const crypto_info({
    Key? key,
    required this.imagePath,
    required this.shortName,
    required this.fullName,
    required this.totalTrade,
    required this.price,
    required this.precentage,
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
            SvgPicture.asset(imagePath),
            Container(width: 12),
            Column(
              children: [
                Text(
                  shortName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  fullName,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(flex: 2),
            Text(totalTrade),
            Spacer(flex: 2),
            Column(
              children: <Widget>[
                Text(price),
                Text(
                  precentage,
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
