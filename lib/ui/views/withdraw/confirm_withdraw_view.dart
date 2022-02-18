import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_row.dart';
import 'package:aomlah/ui/shared/rounded_button.dart';
import 'package:aomlah/ui/views/withdraw/withdraw_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
        automaticallyImplyLeading: false,
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
    return ViewModelBuilder<WithdrawViewModel>.reactive(
        viewModelBuilder: () => WithdrawViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Column(
              children: [
                Container(
                  color: Constants.black2dp,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'تحويل ',
                            style: TextStyle(
                                fontSize: 20, color: Constants.primaryColor),
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
                          cryptoTypeID: 'BTC',
                          text1: 'كمية العملة الرقمية',
                          text2: transaction.satsToBTC(transaction.total)),
                      CusRow(
                          cryptoTypeID: 'BTC',
                          text1: 'رسوم التحويل',
                          text2: transaction.satsToBTC(transaction.fees)),
                      CusRow(
                          cryptoTypeID: 'BTC',
                          text1: 'الإجمالي',
                          text2: transaction
                              .satsToBTC(transaction.total - transaction.fees)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: RoundedButton(
                            textStyle: Constants.robotoFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            // color: Constants.primaryColor,
                            text: 'تأكيد التحويل',
                            press: () {
                              viewmodel.signSendTransaction(transaction);
                            }),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          flex: 1,
                          child: RoundedButton(
                              textStyle: Constants.robotoFont.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              color: Colors.red,
                              text: 'إلغاء',
                              press: () {
                                viewmodel.returnToWallet();
                              })),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
