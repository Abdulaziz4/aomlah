import 'dart:math';

import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/enums/token_decimals.dart';
import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/ui/views/wallet/wallet_info.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/models/usdt_real_time_wallet.dart';

class UsdtWalletInfoView extends StatefulWidget {
  const UsdtWalletInfoView({Key? key}) : super(key: key);

  @override
  _UsdtWalletInfoViewState createState() => _UsdtWalletInfoViewState();
}

class _UsdtWalletInfoViewState extends WalletInfoInterface<UsdtWalletInfoView> {
  @override
  WalletInfo getWalletInfo(BuildContext context) {
    final wallet = Provider.of<UsdtRealTimeWallet>(context);
    double walletBalance =
        convertToWhole(wallet.balance * 1.0, TokenDecimals.usdtTokenDecimals);
    double realTimePrice = 1.0;
    double walletBalanceSAR = double.parse((convertToWhole(
                wallet.balance * realTimePrice,
                TokenDecimals.usdtTokenDecimals) *
            3.75)
        .toStringAsFixed(2));
    return WalletInfo(
        wallet: wallet,
        cryptoType: "USDT",
        types: CryptoTypes.usdt,
        walletBalance: walletBalance,
        walletBalanceSAR: walletBalanceSAR);
  }

  @override
  Widget transactionWidget(RealTimeWallet wallet, CryptoTypes types) {
    // if (wallet.transactions!.isEmpty) {
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

  double convertToWhole(double balance, int decimals) {
    return (balance / (pow(10, decimals) * 1.0));
  }
}
