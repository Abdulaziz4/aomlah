import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_row.dart';
import 'package:aomlah/ui/shared/rounded_button.dart';
import 'package:aomlah/ui/views/withdraw/common/transaction_obj.dart';
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
        ModalRoute.of(context)!.settings.arguments! as TransactionObj;
    final String cryptoType = transaction.cryptoType();
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
                        children: [
                          Text(
                            'تحويل ',
                            style: TextStyle(
                                fontSize: 20, color: Constants.primaryColor),
                          ),
                          Text(
                            " $cryptoType",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),

                      ///from
                      Row(
                        children: const [
                          BlueText(textAlign: TextAlign.right, text: 'من'),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              transaction.transaction.from,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),

                      ///to
                      Row(
                        children: const [
                          BlueText(textAlign: TextAlign.right, text: 'الى'),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              transaction.transaction.to,
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
                          cryptoTypeID: cryptoType,
                          text1: 'كمية العملة الرقمية',
                          text2: transaction.transaction.convertToWholeCoin(
                              transaction.transaction.total,
                              transaction.types)),
                      CusRow(
                          cryptoTypeID: cryptoType,
                          text1: 'رسوم التحويل',
                          text2: transaction.transaction.convertToWholeCoin(
                              transaction.transaction.fees, transaction.types)),
                      CusRow(
                          cryptoTypeID: cryptoType,
                          text1: 'الإجمالي',
                          text2: transaction.transaction.convertToWholeCoin(
                              transaction.transaction.total -
                                  transaction.transaction.fees,
                              transaction.types)),
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
                              viewmodel.signSendTransaction(
                                  transaction.transaction, transaction.types);
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
                              color: Constants.redColor,
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
