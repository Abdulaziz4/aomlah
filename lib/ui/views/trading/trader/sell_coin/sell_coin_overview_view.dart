import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/trading/components/offer_purchase_overview.dart';
import 'package:aomlah/ui/views/trading/components/payment_window.dart';
import 'package:aomlah/ui/views/trading/trader/sell_coin/viewmodels/sell_coin_overview_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class SellCoinOverviewView extends StatelessWidget {
  final Offer offer;
  const SellCoinOverviewView({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btc = Provider.of<Bitcoin>(context);

    return ViewModelBuilder<SellCoinOverviewViewModel>.reactive(
        viewModelBuilder: () => SellCoinOverviewViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: OfferPurchaseOverview(
              offer: offer,
              paymentWindowBuilder: (offer) {
                return PaymentWindow(
                  formKey: viewmodel.formKey,
                  offer: offer,
                  onAmountSaved: viewmodel.setAmount,
                  onSubmit: () {
                    viewmodel.submit(price: btc.price, offer: offer);
                  },
                  onSelectBankAccount: viewmodel.selectBankAccount,
                  selectedBank: viewmodel.bankAccount,
                  errorMessage: viewmodel.errorMessage,
                );
              },
            ),
          );
        });
  }
}
