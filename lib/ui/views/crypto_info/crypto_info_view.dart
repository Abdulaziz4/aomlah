import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/ui/views/market/market_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoInfoView extends StatelessWidget {
  final Coin coin;
  const CryptoInfoView({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: Text("معلومات عن BTC "),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
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
                    Text(
                      "% 4.59 +",
                      style: TextStyle(
                        color: Color(0xff16A79E),
                      ),
                    ),
                    Container(width: 5),
                    Text(coin.price),
                    Spacer(flex: 1),
                    Text("BTC (Bitcoin)"),
                    Container(width: 5),
                    SvgPicture.asset("assets/icons/Group 6.svg"),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: Color(0xff0F1E2C),
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: "١م"),
                      Tab(text: "١أ"),
                      Tab(text: "١ش"),
                      Tab(text: "١س"),
                      Tab(text: "منذ بدايته"),
                    ],
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/Graph.svg"),
              InfoRow(
                field: "مقدار العملة خلال ٢٤ ساعة",
                fieldValue: "1234.9484",
              ),
              InfoRow(
                field: "تغير السعر خلال ٢٤ ساعة",
                fieldValue: "1234.9484",
              ),
              InfoRow(
                field: "سقف السوق",
                fieldValue: "1234.9484",
              ),
              InfoRow(
                field: "العرض المتداول",
                fieldValue: "1234.9484",
              ),
              InfoRow(
                field: "إجمالي العرض خلال ٢٤ ساعة",
                fieldValue: "1234.9484",
              ),
            ],
          )),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String field;
  final String fieldValue;
  const InfoRow({
    Key? key,
    required this.field,
    required this.fieldValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xff0F1E2C),
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xff3D4955),
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            field,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(fieldValue),
        ],
      ),
    );
  }
}
