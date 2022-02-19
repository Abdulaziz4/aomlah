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
            appBar: AppBar(
              title: Text(
                'عروضي',
                style: Constants.largeText.copyWith(
                    color: Constants.darkBlue, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text('شراء', style: Constants.smallText),
                  ),
                  Tab(
                    child: Text('بيع', style: Constants.smallText),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: const [
                      UserOffersCard(
                        isBuy: true,
                      ),
                      UserOffersCard(
                        isBuy: true,
                      ),
                      UserOffersCard(
                        isBuy: true,
                      ),
                      UserOffersCard(
                        isBuy: true,
                      ),
                      UserOffersCard(
                        isBuy: true,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: const [
                      UserOffersCard(
                        isBuy: false,
                      ),
                      UserOffersCard(
                        isBuy: false,
                      ),
                      UserOffersCard(
                        isBuy: false,
                      ),
                      UserOffersCard(
                        isBuy: false,
                      ),
                      UserOffersCard(
                        isBuy: false,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
