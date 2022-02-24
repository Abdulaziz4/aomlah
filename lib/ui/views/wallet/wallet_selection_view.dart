import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/wallet/common/wallet_button.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/utils/constants.dart';
import '../../../core/models/eth_real_time_wallet.dart';
import '../../../core/models/real_time_wallet.dart';

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
    final walletBTC = Provider.of<RealTimeWallet>(context);
    final walletEth = Provider.of<EthRealTimeWallet>(context);

    return ViewModelBuilder<WalletInfoViewModel>.reactive(
        viewModelBuilder: () => WalletInfoViewModel(),
        builder: (context, viewmodel, _) {
          return Column(
            children: [
              Column(
                children: [
                  WalletButton(
                    onPressed: () {
                      viewmodel.navigateToWallet('BTC');
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
                      viewmodel.navigateToWallet('ETH');
                    },
                    cryptoType: 'ETH',
                    balance: (walletEth.balance / 1000000000000000000.0),
                    textStyle: TextStyle(color: Colors.white, fontSize: 18),
                    image: "assets/icons/eth.png",
                  ),
                ],
              )
            ],
          );
        });
  }
}
