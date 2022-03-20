import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/app/utils/currency_helper.dart';
import 'package:aomlah/core/enums/trade_status.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:stacked_services/stacked_services.dart';

class UserTradeCard extends StatelessWidget {
  final Trade trade;
  final bool isForMerchant;

  const UserTradeCard({
    Key? key,
    required this.trade,
    this.isForMerchant = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateLabel = {
      TradeStatus.awaiting_payment: "في الانتظار",
      TradeStatus.payment_sent: "في إنتظار التاكيد",
      TradeStatus.canceled: "ملغي",
      TradeStatus.disputed: "متنازع عليه",
      TradeStatus.completed: "مكتمل",
      TradeStatus.timeout: "نفذ الوقت",
    };
    return GestureDetector(
      onTap: navigateToDetails,
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
                buildTypeLabel(),
                Text(
                  " BTC",
                  style: Constants.smallText.copyWith(color: Colors.white),
                ),
                Spacer(),
                Text(
                  stateLabel[trade.status] ?? "",
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
                                  .toStringAsFixed(2) +
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
                          trade.amount.toStringAsFixed(7),
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
                      CurrencyHelper.btcToFiat(
                                  btcAmount: trade.amount, price: trade.price)
                              .toStringAsFixed(2) +
                          " ر.س",
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

  Widget buildTypeLabel() {
    if (isForMerchant) {
      if (trade.offer!.isBuyMarchent) {
        return buyLabel();
      } else {
        return sellLabel();
      }
    } else {
      if (trade.offer!.isBuyTrader) {
        return buyLabel();
      } else {
        return sellLabel();
      }
    }
  }

  Widget buyLabel() {
    return Text(
      " شراء ",
      style: Constants.smallText.copyWith(color: Constants.primaryColor),
    );
  }

  Widget sellLabel() {
    return Text(
      " بيع  ",
      style: Constants.smallText.copyWith(color: Constants.redColor),
    );
  }

  void navigateToDetails() {
    if (isForMerchant) {
      if (trade.offer!.isBuyMarchent) {
        locator<NavigationService>().navigateTo(
          Routes.merchantBuyCoinView,
          arguments: MerchantBuyCoinViewArguments(trade: trade),
        );
      } else {
        locator<NavigationService>().navigateTo(
          Routes.merchantSellCoinView,
          arguments: MerchantSellCoinViewArguments(trade: trade),
        );
      }
    } else {
      if (trade.offer!.isBuyTrader) {
        locator<NavigationService>().navigateTo(
          Routes.traderBuyCoinView,
          arguments: TraderBuyCoinViewArguments(trade: trade),
        );
      } else {
        locator<NavigationService>().navigateTo(
          Routes.traderSellCoinView,
          arguments: TraderSellCoinViewArguments(trade: trade),
        );
      }
    }
  }
}
