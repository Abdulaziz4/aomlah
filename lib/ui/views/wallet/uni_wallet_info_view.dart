import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/ui/views/wallet/wallet_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/token_decimals.dart';
import '../../../core/models/uni_real_time_wallet.dart';
import 'wallet_info_interface.dart';

class UniWalletInfoView extends StatefulWidget {
  const UniWalletInfoView({Key? key}) : super(key: key);

  @override
  _UniWalletInfoViewState createState() => _UniWalletInfoViewState();
}

class _UniWalletInfoViewState extends WalletInfoInterface<UniWalletInfoView> {
  @override
  WalletInfo getWalletInfo(BuildContext context) {
    final wallet = Provider.of<UniRealTimeWallet>(context);
    double walletBalance =
        convertToWhole(wallet.balance, TokenDecimals.uniTokenDecimals);
    double realTimePrice = 1.0;
    double walletBalanceSAR = double.parse((convertToWhole(
                wallet.balance * realTimePrice,
                TokenDecimals.uniTokenDecimals) *
            3.75)
        .toStringAsFixed(2));
    return WalletInfo(
        wallet: wallet,
        cryptoType: "UNI",
        types: CryptoTypes.uni,
        walletBalance: walletBalance,
        walletBalanceSAR: walletBalanceSAR);
  }

  @override
  Widget transactionWidget(RealTimeWallet wallet, CryptoTypes types) {
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
  }
}
