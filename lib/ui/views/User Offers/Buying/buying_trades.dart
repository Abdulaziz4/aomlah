import 'package:flutter/material.dart';

import '../components/offer_details_card.dart';

class BuyingTrades extends StatefulWidget {
  const BuyingTrades({Key? key}) : super(key: key);

  @override
  _BuyingTradesState createState() => _BuyingTradesState();
}

class _BuyingTradesState extends State<BuyingTrades> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const [
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: const [
              UserOfferCard(
                isBuy: true,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: true,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(
                isBuy: false,
                stat: 'بانتظار الدفع',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
