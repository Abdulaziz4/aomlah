import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/shared/bank_account_item.dart';
import 'package:aomlah/ui/views/trading/components/trade_overview_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfferPurchaseOverview extends StatelessWidget {
  final Offer offer;
  final Widget paymentWindow;
  const OfferPurchaseOverview({
    Key? key,
    required this.offer,
    required this.paymentWindow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btc = Provider.of<Bitcoin>(context);
    return Scaffold(
      appBar: AppBar(
        title: offer.isBuyTrader ? Text("شراء BTC") : Text("بيع BTC"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TradeOverviewHeader(
                price: btc.priceFromMargin(offer.margin).toStringAsFixed(3),
                quantity: offer.cryptoAmonutLabel(),
                minLimit: offer.minTrade,
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
              buildSellerInfo(offer.ownerName ?? ""),
              if (offer.isBuyTrader)
                Column(
                  children: [
                    SizedBox(height: 10),
                    buildBankAccounts(offer.bankAccounts ?? []),
                  ],
                ),
              SizedBox(height: 10),
              buildTermsAndConsitions(offer.terms),
            ],
          ),
        ),
      ),
    );
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
}
