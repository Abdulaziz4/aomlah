import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/user_offer_details/components/user_trade_card.dart';
import 'package:aomlah/ui/views/user_trades/viewmodel/user_trades_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class UserTradesView extends StatelessWidget {
  const UserTradesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserTradesViewModel>.reactive(
      viewModelBuilder: () => UserTradesViewModel(),
      builder: (context, viewmodel, _) => DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'عروضي',
                  style: Constants.largeText.copyWith(
                      color: Constants.darkBlue, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text('شراء', style: Constants.smallText),
                    ),
                    Tab(
                      child: Text('بيع', style: Constants.smallText),
                    ),
                  ],
                ),
              ),
              body: BusyOverlay(
                isBusy: viewmodel.isBusy,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          viewmodel.trades.isEmpty && !viewmodel.isBusy
                              ? buildNoResult()
                              : Column(
                                  children: viewmodel.buyTrades
                                      .map(
                                        (trade) => UserTradeCard(
                                          trade: trade,
                                        ),
                                      )
                                      .toList(),
                                ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          viewmodel.sellTrades.isEmpty && !viewmodel.isBusy
                              ? buildNoResult()
                              : Column(
                                  children: viewmodel.sellTrades
                                      .map(
                                        (trade) => UserTradeCard(
                                          trade: trade,
                                        ),
                                      )
                                      .toList(),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  Widget buildNoResult() {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          SvgPicture.asset("assets/icons/no-record.svg"),
          SizedBox(
            height: 10,
          ),
          Text(
            "لاتوجد تداولات",
            style: Constants.mediumText,
          )
        ],
      ),
    );
  }
}
