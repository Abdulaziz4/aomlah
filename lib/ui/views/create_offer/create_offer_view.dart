import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_buy.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_sell.dart';
import 'package:flutter/material.dart';

class CreateOfferView extends StatelessWidget {
  const CreateOfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.black1dp,
            title: Text(
              'انشاء اعلان',
              style: TextStyle(
                  color: Constants.darkBlue, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'بيع',
                ),
                Tab(
                  text: 'شراء',
                )
              ],
            ),
          ),
          body: CreateOfferBody()),
    );
  }
}

class CreateOfferBody extends StatelessWidget {
  const CreateOfferBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      //SellView
      CreateOfferSell(),
      //BuyView
      CreateOfferBuy()
    ]);
  }
}
