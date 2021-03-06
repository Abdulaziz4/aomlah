import 'package:aomlah/core/app/utils/colors_helper.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/crypto_info/components/base_coin_info.dart';
import 'package:aomlah/ui/views/crypto_info/components/coin_info_row.dart';
import 'package:aomlah/ui/views/crypto_info/viewmodels/crypto_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart' as intl;

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
      length: 5,
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
        text: "15 دقيقة",
      ),
      "value": "15m",
    },
    {
      "tab": Tab(
        text: "1 ساعة",
      ),
      "value": "1h",
    },
    {
      "tab": Tab(
        text: "4 ساعات",
      ),
      "value": "4h",
    },
    {
      "tab": Tab(
        text: "١ يوم",
      ),
      "value": "1d",
    },
    {
      "tab": Tab(
        text: "١ اسبوع",
      ),
      //TODO: Change to 1w
      "value": "4h",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CryptoInfoViewModel>.reactive(
      viewModelBuilder: () => CryptoInfoViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.initCoin(widget.coin);
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
            backgroundColor: brighten(Constants.black2dp, 1),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: brighten(Constants.black2dp, 1),
                  ),
                  child: Column(
                    children: [
                      BaseCoinInfo(coin: viewmodel.coin),
                      TabBar(
                        labelStyle: Constants.verySmallText,
                        unselectedLabelStyle: Constants.verySmallText,
                        labelPadding: EdgeInsets.zero,
                        controller: _tabController,
                        tabs:
                            tabs.map<Tab>((tab) => tab["tab"] as Tab).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                    horizontal: 5,
                  ),
                  color: darken(Constants.black2dp, 30),
                  height: 500,
                  child: BusyOverlay(
                    isBusy: viewmodel.isBusy,
                    child: viewmodel.isFetchingInitial
                        ? Center(child: CircularProgressIndicator())
                        : viewmodel.isNotSupported
                            ? buildNotSupported()
                            : InteractiveChart(
                                candles: viewmodel.candles,
                                style: ChartStyle(
                                  overlayBackgroundColor: Constants.black5dp,
                                  priceGainColor: Constants.primaryColor,
                                  priceLossColor: Colors.red[400]!,
                                  volumeColor: Constants.black5dp,
                                ),
                                overlayInfo: (data) {
                                  final date = intl.DateFormat.yMMMd().format(
                                    DateTime.fromMicrosecondsSinceEpoch(
                                      data.timestamp,
                                    ),
                                  );

                                  return {
                                    "Date": date,
                                    "Open":
                                        data.open?.toStringAsFixed(2) ?? "-",
                                    "High":
                                        data.high?.toStringAsFixed(2) ?? "-",
                                    "Low": data.low?.toStringAsFixed(2) ?? "-",
                                    "Close":
                                        data.close?.toStringAsFixed(2) ?? "-",
                                    "Volume":
                                        data.volume?.asAbbreviated() ?? "-",
                                  };
                                },
                                timeLabel: (timestamp, visibleDataCount) {
                                  final date =
                                      DateTime.fromMicrosecondsSinceEpoch(
                                    timestamp,
                                  );

                                  if (visibleDataCount > 40) {
                                    // If more than 20 data points are visible, we should show year and month.
                                    return "${date.year}-${date.month}"; // yyyy-mm
                                  }
                                  {
                                    return "${date.month}-${date.day}";
                                  }
                                },
                              ),
                  ),
                ),
                SizedBox(height: 12),
                CoinInfoRow(
                  field: "حجم التداول/24 ساعة",
                  fieldValue: viewmodel.coin.volume24hr,
                ),
                CoinInfoRow(
                  field: "التغير/24 ساعة",
                  fieldValue: viewmodel.coin.change24hr,
                ),
                CoinInfoRow(
                  field: "القيمة السوقية",
                  fieldValue: viewmodel.coin.mktCap,
                ),
                CoinInfoRow(
                  field: "العرض المتوفر",
                  fieldValue: viewmodel.coin.circulationSupplayUsd,
                ),
                CoinInfoRow(
                  field: "الحد الأقصى للعرض",
                  fieldValue: viewmodel.coin.maxSupply,
                ),
              ],
            ),
          )),
    );
  }

  Widget buildNotSupported() {
    return Center(
      child: Text("الرسم البياني غير مدعوم لهذه العملة"),
    );
  }
}
