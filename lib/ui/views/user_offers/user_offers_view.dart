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
            backgroundColor: Constants.black3dp,
            title: Text(
              'عروضي',
              style: Constants.largeText.copyWith(
                  color: Constants.darkBlue,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
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
                      isBuy: false,
                    ),
                    UserOffersCard(
                      isBuy: true,
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
              SingleChildScrollView(
                child: Column(
                  children: const [
                    UserOffersCard(
                      isBuy: true,
                    ),
                    UserOffersCard(
                      isBuy: false,
                    ),
                    UserOffersCard(
                      isBuy: true,
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
          ),
        ));
  }
}
