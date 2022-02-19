import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/ui/views/crypto_info/viewmodels/crypto_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:stacked/stacked.dart';

class CryptoInfoView extends StatelessWidget {
  final Coin coin;
  const CryptoInfoView({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CryptoInfoViewModel>.reactive(
      viewModelBuilder: () => CryptoInfoViewModel(),
      onModelReady: (viewmodel) => viewmodel.fetchCandles(coin.name),
      builder: (contect, viewmodel, _) => Scaffold(
          appBar: AppBar(
            title: Text("معلومات عن ${coin.name} "),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Constants.black2dp,
                  ),
                  child: Row(
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
                  ),
                ),
                viewmodel.isBusy
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: 500,
                        child: InteractiveChart(candles: viewmodel.candles),
                      ),
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
            ),
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
