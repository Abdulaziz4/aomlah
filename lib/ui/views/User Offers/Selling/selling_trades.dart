import 'package:flutter/material.dart';

import '../components/offer_details_card.dart';

class SellingTrades extends StatefulWidget {
  const SellingTrades({Key? key}) : super(key: key);

  @override
  _SellingTradesState createState() => _SellingTradesState();
}

class _SellingTradesState extends State<SellingTrades> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const [
              UserOfferCard(
                stat: 'بانتظار الدفع',
              ),
              UserOfferCard(stat: 'بانتظار الدفع',),
              UserOfferCard(stat: 'بانتظار الدفع',),
              UserOfferCard(stat: 'بانتظار الدفع',),
              UserOfferCard(stat: 'بانتظار الدفع',),
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
