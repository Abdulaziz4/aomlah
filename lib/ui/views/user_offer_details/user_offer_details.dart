import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/user_offer_details/components/offer_details.dart';
import 'package:aomlah/ui/views/user_offer_details/components/user_offer_trades.dart';
import 'package:flutter/material.dart';
import '../../../../core/app/utils/constants.dart';

class UserOfferDetailsView extends StatelessWidget {
  final Offer offer;
  const UserOfferDetailsView({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'تفاصيل العرض',
              style: Constants.largeText.copyWith(
                  color: Constants.darkBlue, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('التفاصيل', style: Constants.smallText),
                ),
                Tab(
                  child: Text('عمليات التداول', style: Constants.smallText),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              OfferDetailsSection(
                offer: offer,
              ),
              UserOfferTrades(
                offer: offer,
              ),
            ],
          )),
    );
  }
}
