import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/views/user_offer_details/user_offer_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserOffersCard extends StatelessWidget {
  final Offer offer;
  const UserOffersCard({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = Provider.of<Bitcoin>(context)
        .priceFromMargin(offer.margin)
        .toStringAsFixed(3);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return UserOfferDetailsView(offer: offer);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Constants.black2dp,
          boxShadow: Constants.shadow,
          borderRadius: BorderRadius.circular(9),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                offer.isBuy
                    ? Text(
                        " شراء ",
                        style: Constants.smallText
                            .copyWith(color: Constants.primaryColor),
                      )
                    : Text(
                        " بيع  ",
                        style: Constants.smallText
                            .copyWith(color: Constants.redColor),
                      ),
                Text(
                  offer.cryptoType,
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
                Text(
                  " مقابل " + offer.currencyType,
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
            Text(
              "$price ر.س",
              style: Constants.mediumText
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "الكمية الإجمالية",
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
                Spacer(),
                Text(
                  "BTC ",
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
                Text(
                  offer.totalQuantity.toString(),
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "الحد الأدنى",
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
                Spacer(),
                Text(
                  "${offer.minTrade} ر.س",
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
