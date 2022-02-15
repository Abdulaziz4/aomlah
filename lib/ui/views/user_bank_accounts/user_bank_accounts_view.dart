import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/ui/shared/bank_account_card.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/add_bank_account/add_bank_account_view.dart';
import 'package:aomlah/ui/views/user_bank_accounts/viewmodels/user_bank_accounts_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class UserBankAccountsView extends StatelessWidget {
  const UserBankAccountsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AomlahUser>(context);
    return ViewModelBuilder<UserBankAccountsViewmodel>.reactive(
        viewModelBuilder: () => UserBankAccountsViewmodel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
              appBar: AppBar(title: Text("الحسابات البنكية"), actions: [
                IconButton(
                    onPressed: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBankAccountView(),
                          ),
                        );
                      }
                    },
                    icon: SvgPicture.asset("assets/icons/addIcon.svg")),
              ]),
              body: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SingleChildScrollView(
                  child: user.bankAccounts.isEmpty
                      ? buildNoResult()
                      : Column(
                          children: user.bankAccounts
                              .map(
                                (account) => buildBankAccountWrapper(
                                  account,
                                  () {
                                    viewmodel.deleteBank(account);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildNoResult() {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          SvgPicture.asset("assets/icons/no-record.svg"),
          SizedBox(
            height: 10,
          ),
          Text(
            "لاتوجد حسابات بنكية",
            style: Constants.mediumText,
          )
        ],
      ),
    );
  }

  Widget buildBankAccountWrapper(BankAccount account, void Function() delete) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.black2dp,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Constants.shadow,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      child: BankAccountCard(
        bank: account,
        onDelete: delete,
      ),
    );
  }
}
