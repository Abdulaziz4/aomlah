import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/app/utils/currency_helper.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;

class UserTradeCard extends StatelessWidget {
  final Trade trade;

  const UserTradeCard({Key? key, required this.trade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        // locator<NavigationService>()
        //     .navigateTo(Routes.createOfferView);
      },
      child: Container(
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
                !trade.offer!.isBuyMarchent
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
                  " BTC",
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
                Spacer(),
                Text(
                  trade.status.name,
                  style: Constants.smallText
                      .copyWith(color: Constants.darkBlue, fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "السعر",
                          style: Constants.smallText.copyWith(
                            color: Color(0xFFC6C6C6),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          CurrencyHelper.usdToSR(trade.price)
                                  .toStringAsFixed(4) +
                              " ر.س",
                          style: Constants.smallText
                              .copyWith(color: Color(0xFFC6C6C6)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "الكمية",
                          style: Constants.smallText
                              .copyWith(color: Color(0xFFC6C6C6)),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "BTC ",
                          style: Constants.smallText
                              .copyWith(color: Color(0xFFC6C6C6)),
                        ),
                        Text(
                          trade.amount.toString(),
                          style: Constants.smallText
                              .copyWith(color: Color(0xFFC6C6C6)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "المبلغ",
                      style: Constants.smallText.copyWith(color: Colors.white),
                    ),
                    Text(
                      "2500 ر.س",
                      style: Constants.mediumText.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/profile-icon.svg"),
                SizedBox(
                  width: 5,
                ),
                Text(
                  trade.traderName ?? "",
                  style: Constants.smallText.copyWith(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  intl.DateFormat.yMMMd().add_jm().format(
                        trade.createdAt!,
                      ),
                  style: Constants.smallText
                      .copyWith(color: Color(0xFFC6C6C6), fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
