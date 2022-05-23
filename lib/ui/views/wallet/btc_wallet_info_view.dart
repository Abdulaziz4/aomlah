import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/btc_real_time_wallet.dart';
import 'package:aomlah/ui/views/wallet/wallet_info.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/app/utils/constants.dart';
import '../../../core/enums/crypto_types.dart';
import '../../../core/models/bitcoin.dart';
import '../../../core/models/realtime_wallet.dart';
import 'common/transaction_body.dart';
import 'common/transaction_card.dart';
import 'common/transaction_header.dart';

class BtcWalletInfoView extends StatefulWidget {
  const BtcWalletInfoView({Key? key}) : super(key: key);

  @override
  _BtcWalletInfoViewState createState() => _BtcWalletInfoViewState();
}

class _BtcWalletInfoViewState extends WalletInfoInterface<BtcWalletInfoView> {
  @override
  WalletInfo getWalletInfo(BuildContext context) {
    final wallet = Provider.of<BtcRealTimeWallet>(context);
    final user = Provider.of<AomlahUser>(context);

    double walletBalance = wallet.balanceBTC(user.debt);
    double realTimePrice = Provider.of<Bitcoin>(context).price;
    double walletBalanceSAR = wallet.balanceSR(realTimePrice, user.debt);
    return WalletInfo(
        wallet: wallet,
        cryptoType: "BTC",
        types: CryptoTypes.bitcoin,
        walletBalance: walletBalance,
        walletBalanceSAR: walletBalanceSAR);
  }

  @override
  Widget transactionWidget(RealTimeWallet wallet, CryptoTypes types) {
    if (wallet.transactions!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/no-record.svg'),
            SizedBox(
              height: 5,
            ),
            Text(
              'لا يوجد معاملات',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: wallet.transactions!
              .map((e) => TransactionCard(
                    title: TransactionHead(
                        transaction: e,
                        address: wallet.address,
                        cryptoType: types),
                    expandedSection: TransactionBody(
                      transaction: e,
                      cryptoType: types,
                    ),
                    color: Constants.black3dp,
                  ))
              .toList(),
        ),
      );
    }
  }

  double convertToBTC(double balance) {
    return (balance / 100000000);
  }
}
