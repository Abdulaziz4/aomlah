import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/ui/add_bank_account/add_bank_acc_view.dart';
import 'package:aomlah/ui/shared/bank_account_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class UserBankAccountsView extends StatelessWidget {
  const UserBankAccountsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AomlahUser>(context);
    return Scaffold(
      appBar: AppBar(title: Text("الحسابات البنكية"), actions: [
        IconButton(
            onPressed: () {
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddBankAccView()));
              }
            },
            icon: SvgPicture.asset("assets/icons/addIcon.svg")),
      ]),
      body: Column(
        children: [
          BankAccountCard(
            bank: BankAccount(
              bankName: "الرياض",
              iban: "3897138173813",
              ownerName: "علي سعيد الشمري",
            ),
            onDelete: () {},
          ),
        ],
      ),
    );
  }
}
