import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class OfferCard extends StatelessWidget {
  final bool isBuy;
  const OfferCard({
    Key? key,
    this.isBuy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          {locator<NavigationService>().navigateTo(Routes.buyCoinOverviewView)},
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
                Text("عبدالعزيز"),
                Spacer(),
                Text("2021/5/1")
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
                      buildInfoItem("السعر", "121,41241,124 ر.س"),
                      Spacer(),
                      buildInfoItem("الكمية", "0.1245 BTC"),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoItem("الحد الادنى", "2000 ر.س"),
                        Spacer(),
                        isBuy
                            ? CustomButton(
                                onPressed: () {},
                                text: "شراء",
                              )
                            : CustomButton(
                                onPressed: () {},
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
