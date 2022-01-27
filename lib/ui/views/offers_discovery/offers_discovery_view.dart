import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class OffersDiscoveryView extends StatelessWidget {
  const OffersDiscoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                locator<NavigationService>().navigateTo(Routes.createOfferView);
              },
              icon: Icon(Icons.add),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: const OfferBody());
  }
}

class OfferBody extends StatelessWidget {
  const OfferBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Offs ....."),
    );
  }
}
