import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/bank_account_item.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/trading/components/payment_window.dart';
import 'package:aomlah/ui/views/trading/components/trade_overview_header.dart';
import 'package:aomlah/ui/views/trading/trader/buy_coin/viewmodels/buy_coin_overview_viewmodel.dart';

class BuyCoinOverviewView extends StatefulWidget {
  final Offer offer;
  const BuyCoinOverviewView({Key? key, required this.offer}) : super(key: key);

  @override
  State<BuyCoinOverviewView> createState() => _BuyCoinOverviewViewState();
}

class _BuyCoinOverviewViewState extends State<BuyCoinOverviewView> {
  @override
  Widget build(BuildContext context) {
    final btc = Provider.of<Bitcoin>(context);

    return ViewModelBuilder<BuyCoinOverviewViewmodel>.reactive(
        viewModelBuilder: () => BuyCoinOverviewViewmodel(),
        onModelReady: (viewmodel) => viewmodel.listentoOffers(widget.offer),
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
                        price: btc
                            .priceFromMargin(viewmodel.offer.margin)
                            .toStringAsFixed(3),
                        quantity: viewmodel.offer.cryptoAmonutLabel(),
                        minLimit: viewmodel.offer.minTrade,
                      ),
                      buildPurchaseWindow(
                        offer: viewmodel.offer,
                        key: viewmodel.formKey,
                        onSave: viewmodel.setAmount,
                        submit: () {
                          viewmodel.submit(btc.price);
                        },
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
                      buildSellerInfo(viewmodel.offer.ownerName ?? ""),
                      SizedBox(height: 10),
                      buildBankAccounts(viewmodel.offer.bankAccounts ?? []),
                      SizedBox(height: 10),
                      buildTermsAndConsitions(viewmodel.offer.terms),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Column buildTermsAndConsitions(String terms) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الشروط والاحكام",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          terms,
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildSellerInfo(String sellerName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "البائع",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          sellerName,
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildBankAccounts(List<BankAccount> banks) {
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
          children: banks
              .map((bank) => BankAccountItem(bankName: bank.bankName))
              .toList(),
        ),
      ],
    );
  }

  Widget buildPurchaseWindow({
    required Offer offer,
    required GlobalKey<FormState> key,
    required void Function(String) onSave,
    required void Function() submit,
  }) {
    return PaymentWindow(
      offer: offer,
      formKey: key,
      onAmountSaved: onSave,
      onSubmit: submit,
    );
  }
}
