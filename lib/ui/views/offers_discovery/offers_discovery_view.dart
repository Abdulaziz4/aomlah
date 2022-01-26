import 'package:flutter/material.dart';

class OffersDiscoveryView extends StatelessWidget {
  const OffersDiscoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OfferBody()
    );
  }
}

class OfferBody extends StatelessWidget {
  const OfferBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Offers ....."),
    );
  }
}
