import 'package:aomlah/ui/views/crypto_info/crypto_info_view.dart';
import 'package:aomlah/ui/views/market/viewmodels/market_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketViewmodel>.reactive(
        viewModelBuilder: () => MarketViewmodel(),
        onModelReady: (model) => model.connectSocket(),
        builder: (context, viewmodel, _) {
          return Scaffold(
              appBar: AppBar(
                title: Text("سوق العملات"),
              ),
              body: SingleChildScrollView(
                child: Column(
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
                    ...viewmodel.coins
                        .map(
                          (coin) => CryptoInfo(
                            imagePath:
                                "https://images.cryptocompare.com/sparkchart/${coin.name}/USD/latest.png?ts=1645038000",
                            shortName: coin.name,
                            fullName: coin.fullName,
                            totalTrade: coin.volume24hr,
                            price: coin.price,
                            precentage: "% " + coin.change24hr,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ));
        });
  }
}

class CryptoInfo extends StatelessWidget {
  final String imagePath;
  final String shortName;
  final String fullName;
  final String totalTrade;
  final String price;
  final String precentage;

  const CryptoInfo({
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
            Image.network(imagePath),
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
