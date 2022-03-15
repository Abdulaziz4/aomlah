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
          bottomNavigationBar: BottomAppBar(
            color: Color(0xFF263441),
            child: Container(
              width: 390,
              height: 84,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(15, 30, 44, 0.8299999833106995),
              ),
              child: Row(
                children: <Widget>[
                  CustomButton(
                    onPressed: () {},
                    text: 'تعديل',
                    color: Color(0xFF7BB9FA),
                    height: 37,
                    width: 170,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: 'إغلاق',
                    color: Color(0xFFCF5050),
                    height: 37,
                    width: 170,
                  ),
                ],
              ),
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
