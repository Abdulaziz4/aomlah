import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/ui/shared/button_tile.dart';
import 'package:aomlah/ui/shared/expandable_card.dart';
import 'package:aomlah/ui/views/chat_/chat_view.dart';
import 'package:flutter/material.dart';

class TradeExtraInfo extends StatelessWidget {
  final String terms;
  final List<BankAccount> bankAccounts;

  const TradeExtraInfo({
    Key? key,
    required this.terms,
    required this.bankAccounts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        ExpandableCard(
          title: "الشروط والاحكام",
          expandedSection: Text(terms),
          color: Constants.black2dp,
        ),
        ExpandableCard(
          title: "الحسابات البنكية",
          expandedSection: Text("اثممخ"),
          color: Constants.black2dp,
        ),
        ButtonTile(
          onPressed: () {
            Navigator.push(
              context,MaterialPageRoute(builder: (context)=> const ChatView()),
            );
          },
          text: "المحادثة",
          verticalMargin: 20,
        ),
      ],
    );
  }
}
