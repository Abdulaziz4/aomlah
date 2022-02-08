import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/bank_account_item.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/trading/components/spanned_text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyCoinOverviewView extends StatelessWidget {
  const BuyCoinOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("شراء BTC"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpannedTextItem(
                rightText: "السعر",
                leftText: "144.134.13 ر.س",
              ),
              SpannedTextItem(
                rightText: "الكمية",
                leftText: "0.04151 BTC",
              ),
              SpannedTextItem(
                rightText: "الحد الادنى",
                leftText: "200 ر.س",
              ),
              buildPurchaseWindow(),
              Row(
                children: [
                  Text(
                    "تفاصيل التداول",
                    style: Constants.largeText.copyWith(
                      color: Constants.darkBlue,
                    ),
                  ),
                ],
              ),
              buildSellerInfo(),
              SizedBox(height: 10),
              buildBankAccounts(),
              SizedBox(height: 10),
              buildTermsAndConsitions(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildTermsAndConsitions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الشروط والاحكام",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          "ما أقبل اس تي سي باي",
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildSellerInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "البائع",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Text(
          "عبدالعزيز القحطني",
          style: Constants.mediumText,
        ),
      ],
    );
  }

  Widget buildBankAccounts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الحسابات البنكية",
          style: Constants.mediumText.copyWith(color: Colors.grey),
        ),
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 5.0,
          spacing: 20.0,
          children: const [
            BankAccountItem(bankName: "بنك الرياض"),
            BankAccountItem(bankName: "بنك الراجحي"),
          ],
        ),
      ],
    );
  }

  Widget buildPurchaseWindow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Constants.black2dp,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          RoundedInputField(
            label: "المبلغ",
            hintText: "ادخل المبلغ",
            fillColor: Constants.black4dp,
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ر.س",
                  style: Constants.smallText,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ستحصل على",
                style: Constants.smallText.copyWith(color: Colors.grey),
              ),
              Text(
                "0 BTC",
                style: Constants.smallText,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomButton(
              onPressed: () {},
              text: "شراء BTC",
              width: double.infinity,
              height: 43,
            ),
          )
        ],
      ),
    );
  }
}
