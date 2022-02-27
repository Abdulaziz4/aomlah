import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/views/trading/components/offer_purchase_overview.dart';
import 'package:aomlah/ui/views/trading/components/payment_window.dart';
import 'package:aomlah/ui/views/trading/trader/sell_coin/viewmodels/sell_coin_overview_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SellCoinOverviewView extends StatelessWidget {
  final Offer offer;
  const SellCoinOverviewView({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SellCoinOverviewViewModel>.reactive(
        viewModelBuilder: () => SellCoinOverviewViewModel(),
        builder: (context, viewmodel, _) {
          return OfferPurchaseOverview(
            offer: offer,
            paymentWindowBuilder: (offer) {
              return PaymentWindow(
                formKey: viewmodel.formKey,
                offer: offer,
                onAmountSaved: viewmodel.setAmount,
                onSubmit: viewmodel.submit,
                onSelectBankAccount: viewmodel.selectBankAccount,
              );
            },
          );
        });
  }
}
