import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/bank_account_item.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/trading/components/payment_window.dart';
import 'package:aomlah/ui/views/trading/components/trade_overview_header.dart';
import 'package:aomlah/ui/views/trading/trader/buy_coin/viewmodels/buy_coin_overview_viewmodel.dart';

class BuyCoinOverviewView extends StatefulWidget {
  const BuyCoinOverviewView({Key? key}) : super(key: key);

  @override
  State<BuyCoinOverviewView> createState() => _BuyCoinOverviewViewState();
}

class _BuyCoinOverviewViewState extends State<BuyCoinOverviewView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyCoinOverviewViewmodel>.reactive(
        viewModelBuilder: () => BuyCoinOverviewViewmodel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
              appBar: AppBar(
                title: Text("شراء BTC"),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TradeOverviewHeader(
                        price: "144,1313,13",
                        quantity: 0.422,
                        minLimit: 1335,
                      ),
                      buildPurchaseWindow(
                        key: viewmodel.formKey,
                        onSave: viewmodel.setAmount,
                        submit: viewmodel.submit,
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
                      buildBankAccounts(),
                      SizedBox(height: 10),
                      buildTermsAndConsitions(),
                    ],
                  ),
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

  Widget buildBankAccounts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الحسابات البنكية",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 5.0,
          spacing: 20.0,
          children: const [
            BankAccountItem(bankName: "بنك الرياض"),
            BankAccountItem(bankName: "بنك الراجحي"),
          ],
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
