import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/bank_account_item.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Row(
                      children: [
                        Text(
                          "تفاصيل التداول",
                          style: Constants.largeText.copyWith(
                            color: Constants.darkBlue,
                          ),
                        ),
                      ],
                    ),
                    buildSellerInfo(),
                    SizedBox(height: 10),
                    buildTermsAndConsitions(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Column buildTermsAndConsitions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الشروط والاحكام",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          "ما أقبل اس تي سي باي",
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildSellerInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "البائع",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          "عبدالعزيز القحطني",
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildPurchaseWindow({
    required GlobalKey<FormState> key,
    required void Function(String) onSave,
    required void Function() submit,
  }) {
    return PaymentWindow(
      isBuy: true,
      formKey: key,
      onAmountSaved: onSave,
      onSubmit: submit,
    );
  }
}
