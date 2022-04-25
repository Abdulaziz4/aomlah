import 'dart:math';
import 'package:aomlah/core/enums/token_decimals.dart';
import 'package:aomlah/core/models/usdt_real_time_wallet.dart';
import 'package:aomlah/ui/views/wallet/common/wallet_button.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app/utils/constants.dart';
import '../../../core/models/bat_real_time_wallet.dart';
import '../../../core/models/eth_real_time_wallet.dart';
import '../../../core/models/btc_real_time_wallet.dart';
import '../../../core/models/uni_real_time_wallet.dart';

class WalletSelectionView extends StatelessWidget {
  const WalletSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black1dp,
        title: Text('wallet',
            style: TextStyle(
                color: Constants.darkBlue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: WalletSelectionViewBody(),
    );
  }
}

class WalletSelectionViewBody extends StatelessWidget {
  const WalletSelectionViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletBTC = Provider.of<BtcRealTimeWallet>(context);
    final walletEth = Provider.of<EthRealTimeWallet>(context);
    final walletUsdt = Provider.of<UsdtRealTimeWallet>(context);
    final walletUni = Provider.of<UniRealTimeWallet>(context);
    final walletBat = Provider.of<BatRealTimeWallet>(context);

    return ViewModelBuilder<WalletInfoViewModel>.reactive(
        viewModelBuilder: () => WalletInfoViewModel(),
        builder: (context, viewmodel, _) {
          return Column(
            children: [
              Column(
                children: [
                  WalletButton(
                    onPressed: () {
                      viewmodel.navigateToWalletBTC();
                    },
                    cryptoType: 'BTC',
                    balance: (walletBTC.balance / 100000000.0),
                    textStyle: TextStyle(color: Colors.white, fontSize: 18),
                    image: "assets/icons/btc.png",
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  WalletButton(
                    onPressed: () {
                      viewmodel.navigateToWalletEth();
                    },
                    cryptoType: 'ETH',
                    balance: (walletEth.balance /
                        pow(10, TokenDecimals.ethTokenDecimals) *
                        1.0),
                    textStyle: TextStyle(color: Colors.white, fontSize: 18),
                    image: "assets/icons/eth.png",
                  ),

                  ///USDT
                  SizedBox(
                    height: 1,
                  ),
                  WalletButton(
                    onPressed: () {
                      viewmodel.navigateToWalletUsdt();
                    },
                    cryptoType: 'USDT',
                    balance: (walletUsdt.balance /
                        pow(10, TokenDecimals.usdtTokenDecimals) *
                        1.0),
                    textStyle: TextStyle(color: Colors.white, fontSize: 18),
                    image: "assets/icons/Tether-USDT-icon.png",
                  ),

                  ///UNISWAP
                  SizedBox(
                    height: 1,
                  ),
                  WalletButton(
                    onPressed: () {
                      viewmodel.navigateToWalletUni();
                    },
                    cryptoType: 'UNI',
                    balance: double.parse(((walletUni.balance /
                            pow(10, TokenDecimals.uniTokenDecimals) *
                            1.0)
                        .toStringAsFixed(5))),
                    textStyle: TextStyle(color: Colors.white, fontSize: 18),
                    image: "assets/icons/uniswap-uni-logo.png",
                  ),

                  ///BAT
                  SizedBox(
                    height: 1,
                  ),
                  WalletButton(
                    onPressed: () {
                      viewmodel.navigateToWalletBat();
                    },
                    cryptoType: 'BAT',
                    balance: double.parse(((walletBat.balance /
                            pow(10, TokenDecimals.batTokenDecimals) *
                            1.0)
                        .toStringAsFixed(5))),
                    textStyle: TextStyle(color: Colors.white, fontSize: 18),
                    image: "assets/icons/Basic-Attention-Token-icon.png",
                  ), // WalletButton(onPressed: vi, cryptoType: cryptoType, balance: balance, image: image)
                ],
              )
            ],
          );
        });
  }
}
