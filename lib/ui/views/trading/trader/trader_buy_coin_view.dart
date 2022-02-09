import 'package:aomlah/core/app/utils/colors_helper.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/button_tile.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/shared/expandable_card.dart';
import 'package:aomlah/ui/views/trading/components/receipt_info.dart';
import 'package:flutter/material.dart';

class TraderBuyCoinView extends StatelessWidget {
  const TraderBuyCoinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                verticalDirection: VerticalDirection.up,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ExpandableCard(
                    title: "الشروط والاحكام",
                    expandedSection: Text("ماقبل اس تي سي باي"),
                    color: Constants.black2dp,
                  ),
                  ExpandableCard(
                    title: "الحسابات البنكية",
                    expandedSection: Text("اثممخ"),
                    color: Constants.black2dp,
                  ),
                  ButtonTile(
                    onPressed: () {},
                    text: "المحادثة",
                  ),
                  buildRecipte(),
                  buildHeader(),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 15,
              right: 15,
            ),
            color: darken(Constants.black2dp, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomButton(
                    onPressed: () {},
                    text: "تم التحويل، أخبر البائع",
                    height: 45,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    text: "الغاء",
                    color: Constants.redColor,
                    height: 45,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildRecipte() {
    return Container(
      color: Constants.black2dp,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "شراء",
                    style: Constants.largeText.copyWith(
                      color: Constants.primaryColor,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("BTC", style: Constants.largeText),
                ],
              ),
              RecipteInfo(
                rightText: "المبلغ الاجمالي",
                leftText: "3000 ر.س",
              ),
              RecipteInfo(
                rightText: "السعر",
                leftText: "144,644,244 ر.س",
              ),
              RecipteInfo(
                rightText: "كمية العملة الرقمية",
                leftText: "0.533443 BTC",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildHeader() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: Constants.shadow,
        color: Constants.black2dp,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close_rounded, size: 30),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تم إنشاء الطلب",
                    style: Constants.robotoFont.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "يرجى الدفع للبائع خلال 30:00",
                    style: Constants.robotoFont.copyWith(
                      fontSize: 18,
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
}
