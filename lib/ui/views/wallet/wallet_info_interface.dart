import 'package:aomlah/core/models/wallet_info.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_viewmodel.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app/utils/constants.dart';
import '../../../core/enums/crypto_types.dart';
import '../../../core/models/real_time_wallet.dart';
import '../../../core/services/realtime_wallet.dart';
import 'common/conversion_button.dart';
import 'common/wallet_container.dart';

abstract class WalletInfoInterface<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletInfoViewModel>.reactive(
        viewModelBuilder: () => WalletInfoViewModel(),
        builder: (context, viewmodel, _) {
          final WalletInfo walletInfo = getWalletInfo(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Constants.black1dp,
              title: Text('محفظتك',
                  style: TextStyle(
                      color: Constants.darkBlue, fontWeight: FontWeight.bold)),
              centerTitle: true,
            ),
            body: Column(
              children: [
                WalletContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'القيمة الكلية',
                        style: TextStyle(color: Constants.darkBlue),
                      ),
                      // Text('PLACEHOLDER'),
                      Row(
                        children: [
                          Text(
                            walletInfo.cryptoType,
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            walletInfo.walletBalance.toString(),
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            ' ≈ ',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            walletInfo.walletBalanceSAR.toString(),
                            style: TextStyle(
                                // fontWeight: FontWeight.,
                                fontSize: 18),
                          ),
                          Text(
                            ' ر.س',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'عنوان المحفظة',
                        style: TextStyle(color: Constants.darkBlue),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text(walletInfo.wallet.address)),
                          TextButton(
                              onPressed: () {
                                FlutterClipboard.copy(walletInfo.wallet.address)
                                    .then((value) => print('copied'));
                              },
                              child: Icon(Icons.copy)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ConversionButton(
                              text: 'تحويل',
                              press: () {
                                viewmodel.navigateToWithdrawView();
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'سجل المعاملات',
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                // Expanded(flex: 1, child: transactionsWidget(wallet, cryptoType)),
                Expanded(
                    flex: 1,
                    child:
                        transactionWidget(walletInfo.wallet, walletInfo.types)),
              ],
            ),
          );
        });
  }

  transactionWidget(RealTimeWallet wallet, CryptoTypes types);

  WalletInfo getWalletInfo(BuildContext context);
}
