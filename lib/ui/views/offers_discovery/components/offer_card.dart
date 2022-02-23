import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class OfferCard extends StatelessWidget {
  final Offer offer;
  const OfferCard({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = Provider.of<Bitcoin>(context)
        .priceFromMargin(offer.margin)
        .toStringAsFixed(3);
    return GestureDetector(
      onTap: () => {
        if (offer.isBuy)
          {
            locator<NavigationService>().navigateTo(Routes.buyCoinOverviewView),
          }
        else
          {
            locator<NavigationService>()
                .navigateTo(Routes.sellCoinOverviewView),
          }
      },
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Constants.black2dp,
          boxShadow: Constants.shadow,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/icons/profile-icon.svg"),
                SizedBox(width: 5),
                Text(offer.ownerName ?? ""),
                Spacer(),
                Text(
                  intl.DateFormat.yMMMd().add_jm().format(
                        offer.createAt!,
                      ),
                  textDirection: TextDirection.ltr,
                  style: Constants.verySmallText.copyWith(color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 5),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItem("السعر", "$price ر.س"),
                      Spacer(),
                      buildInfoItem("الكمية", offer.cryptoAmonutLabel()),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoItem("الحد الادنى", "${offer.minTrade} ر.س"),
                        Spacer(),
                        offer.isBuy
                            ? CustomButton(
                                onPressed: () {
                                  locator<NavigationService>()
                                      .navigateTo(Routes.buyCoinOverviewView);
                                },
                                text: "شراء",
                              )
                            : CustomButton(
                                onPressed: () {
                                  locator<NavigationService>()
                                      .navigateTo(Routes.sellCoinOverviewView);
                                },
                                text: "بيع",
                                color: Constants.redColor,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Constants.smallText.copyWith(
            color: Constants.darkBlue,
          ),
        ),
        Text(
          subtitle,
          style: Constants.mediumText,
        ),
      ],
    );
  }
}
