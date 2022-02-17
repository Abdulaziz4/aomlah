import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/ui/shared/custom_row.dart';
import 'package:aomlah/ui/shared/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../core/app/utils/constants.dart';
import '../wallet/common/blue_text.dart';

class ConfirmWithdrawView extends StatelessWidget {
  const ConfirmWithdrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black1dp,
        title: Text(
          'تأكيد عملية التحويل',
          style:
              TextStyle(color: Constants.darkBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ConfirmWithdrawViewBody(),
    );
  }
}

class ConfirmWithdrawViewBody extends StatelessWidget {
  const ConfirmWithdrawViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transaction =
        ModalRoute.of(context)!.settings.arguments as UnconfirmedTransaction;
    return Column(
      children: [
        Container(
          color: Constants.black3dp,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'تحويل ',
                    style:
                        TextStyle(fontSize: 20, color: Constants.primaryColor),
                  ),
                  Text(
                    " BTC",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),

              ///from
              Row(
                children: [
                  BlueText(textAlign: TextAlign.right, text: 'من'),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      transaction.from,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              ///to
              Row(
                children: [
                  BlueText(textAlign: TextAlign.right, text: 'الى'),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      transaction.to,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              ///total
              CusRow(
                  text1: 'كمية العملة الرقمية',
                  text2: transaction.satsToBTC(transaction.total) + ' BTC '),
              CusRow(
                  text1: 'رسوم التحويل',
                  text2: transaction.satsToBTC(transaction.fees) + ' BTC '),
              CusRow(
                  text1: 'الإجمالي',
                  text2: transaction
                          .satsToBTC(transaction.fees + transaction.total) +
                      ' BTC '),
            ],
          ),
        ),
        RoundedButton(text: 'confirm', press: () {})
      ],
    );
  }
}
