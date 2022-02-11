 import 'package:aomlah/ui/views/create_offer/create_offer_buy.dart';
 import 'package:aomlah/ui/views/create_offer/create_offer_sell.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../../../core/app/utils/constants.dart';
import 'components/user_offers_card.dart';

class UserOffersView extends StatelessWidget {
  const UserOffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       backgroundColor: Color(0xFF00101F),
          appBar: AppBar(
            //backgroundColor: Constants.black3dp,
            backgroundColor: Constants.black3dp,
            title: Text(
              'عروضي',
              style: TextStyle(
                // color: Constants.darkBlue, fontWeight: FontWeight.bold),
                  color: Constants.darkBlue, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,



            ),
            body: TabBarView(
            children: [
            SingleChildScrollView(
            child: Column(
            children: const [
              OffersCard(
                isBuy: true,
              ),
              OffersCard(
                isBuy: false,
              ),
              OffersCard(
                isBuy: true,
              ),
              OffersCard(
                isBuy: false,
              ),
              OffersCard(
                isBuy: false,
              ),
            ],
            ),
            ),
    SingleChildScrollView(
    child: Column(
    children: const [
    OffersCard(
    isBuy: true,
    ),
    OffersCard(
    isBuy: false,
    ),
    OffersCard(
    isBuy: true,
    ),
    OffersCard(
    isBuy: false,
    ),
    OffersCard(
    isBuy: false,
    ),
    ],
    ),
    ),
    ],
    ),

    )
    );
  }
}


