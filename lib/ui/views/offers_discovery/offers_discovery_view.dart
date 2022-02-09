import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/ui/views/offers_discovery/components/offer_card.dart';
import 'package:aomlah/ui/views/offers_discovery/offers_discovery_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OffersDiscoveryView extends StatelessWidget {
  const OffersDiscoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OffersDiscoveryViewModel>.reactive(
        viewModelBuilder: () => OffersDiscoveryViewModel(),
        builder: (context, viewmodel, _) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text("التداول"),
                actions: [
                  IconButton(
                    onPressed: () {
                      locator<NavigationService>()
                          .navigateTo(Routes.createOfferView);
                    },
                    icon: Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: viewmodel.logout,
                    icon: Icon(Icons.logout),
                  ),
                ],
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelStyle: Theme.of(context).textTheme.headline4,
                  tabs: const [
                    Tab(text: "شراء"),
                    Tab(text: "بيع"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: const [
                        OfferCard(),
                        OfferCard(),
                        OfferCard(),
                        OfferCard(),
                        OfferCard(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: const [
                        OfferCard(
                          isBuy: false,
                        ),
                        OfferCard(
                          isBuy: false,
                        ),
                        OfferCard(
                          isBuy: false,
                        ),
                        OfferCard(
                          isBuy: false,
                        ),
                        OfferCard(
                          isBuy: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
