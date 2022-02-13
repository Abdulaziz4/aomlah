import 'package:aomlah/ui/views/trading/components/payment_window.dart';
import 'package:aomlah/ui/views/trading/components/trade_overview_header.dart';
import 'package:aomlah/ui/views/trading/trader/sell_coin/viewmodels/sell_coin_overview_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SellCoinOverviewView extends StatelessWidget {
  const SellCoinOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SellCoinOverviewViewModel>.reactive(
        viewModelBuilder: () => SellCoinOverviewViewModel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("بيع BTC"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TradeOverviewHeader(
                      price: "144,1313,13",
                      quantity: 0.422,
                      minLimit: 1335,
                    ),
                    PaymentWindow(
                      isBuy: false,
                      formKey: viewmodel.formKey,
                      onAmountSaved: viewmodel.setAmount,
                      onSubmit: viewmodel.submit,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
