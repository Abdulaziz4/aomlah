import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/views/trading/components/offer_purchase_overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/trading/components/payment_window.dart';
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
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: OfferPurchaseOverview(
              offer: widget.offer,
              paymentWindowBuilder: (offer) {
                return PaymentWindow(
                  offer: offer,
                  formKey: viewmodel.formKey,
                  onAmountSaved: viewmodel.setAmount,
                  onSubmit: () {
                    viewmodel.submit(btc.price, offer.offerID);
                  },
                );
              },
            ),
          );
        });
  }
}
