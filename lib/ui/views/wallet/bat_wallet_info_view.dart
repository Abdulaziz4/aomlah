import 'dart:math';

import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/ui/views/wallet/wallet_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/enums/token_decimals.dart';
import '../../../core/models/bat_real_time_wallet.dart';
import 'wallet_info_interface.dart';

class BatWalletInfoView extends StatefulWidget {
  const BatWalletInfoView({Key? key}) : super(key: key);

  @override
  _BatWalletInfoViewState createState() => _BatWalletInfoViewState();
}

class _BatWalletInfoViewState extends WalletInfoInterface<BatWalletInfoView> {
  @override
  WalletInfo getWalletInfo(BuildContext context) {
    final wallet = Provider.of<BatRealTimeWallet>(context);
    double walletBalance =
        convertToWhole(wallet.balance * 1.0, TokenDecimals.batTokenDecimals);
    double realTimePrice = 1.0;
    double walletBalanceSAR = double.parse((convertToWhole(
                wallet.balance * realTimePrice,
                TokenDecimals.batTokenDecimals) *
            3.75)
        .toStringAsFixed(2));
    return WalletInfo(
        wallet: wallet,
        cryptoType: "BAT",
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

  @override
  double convertToWhole(double balance, int decimals) {
    return (balance / (pow(10, decimals) * 1.0));
  }
}
