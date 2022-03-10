import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/ui/shared/bank_account_card.dart';
import 'package:aomlah/ui/shared/button_tile.dart';
import 'package:aomlah/ui/shared/expandable_card.dart';
import 'package:flutter/material.dart';

class TradeExtraInfo extends StatelessWidget {
  final String? terms;
  final List<BankAccount>? bankAccounts;

  const TradeExtraInfo({
    Key? key,
    this.terms,
    this.bankAccounts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        if (terms != null)
          ExpandableCard(
            title: "الشروط والاحكام",
            expandedSection: Text(terms ?? ""),
            color: Constants.black2dp,
          ),
        if (bankAccounts != null)
          ExpandableCard(
            title: "الحسابات البنكية",
            expandedSection: Column(
              children: bankAccounts!
                  .map(
                    (bank) => BankAccountCard(
                      bank: bank,
                      fontSize: 15,
                    ),
                  )
                  .toList(),
            ),
            color: Constants.black2dp,
          ),
        ButtonTile(
          onPressed: () {},
          text: "المحادثة",
          verticalMargin: 20,
        ),
      ],
    );
  }
}
