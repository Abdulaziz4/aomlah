import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/crypto_info/components/base_coin_info.dart';
import 'package:aomlah/ui/views/crypto_info/viewmodels/crypto_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:stacked/stacked.dart';

class CryptoInfoView extends StatefulWidget {
  final Coin coin;
  const CryptoInfoView({Key? key, required this.coin}) : super(key: key);

  @override
  State<CryptoInfoView> createState() => _CryptoInfoViewState();
}

class _CryptoInfoViewState extends State<CryptoInfoView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<Map<String, dynamic>> tabs = [
    {
      "tab": Tab(
        text: "١ يوم",
      ),
      "value": "1d",
    },
    {
      "tab": Tab(
        text: "٣ يوم",
      ),
      "value": "3d",
    },
    {
      "tab": Tab(
        text: "١ اسبوع",
      ),
      "value": "1w",
    },
    {
      "tab": Tab(
        text: "١ شهر",
      ),
      "value": "1m",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CryptoInfoViewModel>.reactive(
      viewModelBuilder: () => CryptoInfoViewModel(),
      onModelReady: (viewmodel) {
        _tabController.addListener(() {
          viewmodel.fetchCandles(
            widget.coin.name,
            tabs[_tabController.index]["value"],
          );
        });
        viewmodel.fetchCandles(
          widget.coin.name,
          tabs[_tabController.index]["value"],
          isInitial: true,
        );
      },
      builder: (contect, viewmodel, _) => Scaffold(
          appBar: AppBar(
            title: Text("معلومات عن ${widget.coin.name} "),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                  decoration: BoxDecoration(
                    color: Constants.black2dp,
                  ),
                  child: Column(
                    children: [
                      BaseCoinInfo(coin: widget.coin),
                      TabBar(
                        controller: _tabController,
                        tabs:
                            tabs.map<Tab>((tab) => tab["tab"] as Tab).toList(),
                      ),
                    ],
                  ),
                ),
                viewmodel.isFetchingInitial
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: 500,
                        child: BusyOverlay(
                          isBusy: viewmodel.isBusy,
                          child: InteractiveChart(candles: viewmodel.candles),
                        ),
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
