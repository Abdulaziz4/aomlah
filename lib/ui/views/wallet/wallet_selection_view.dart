import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/utils/constants.dart';

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
    return ViewModelBuilder<WalletInfoViewModel>.reactive(
        viewModelBuilder: () => WalletInfoViewModel(),
        builder: (context, viewmodel, _) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        viewmodel.navigateToWallet('ETH');
                      },
                      text: 'eth',
                      // child: Text(
                      //   ,
                      //   style: TextStyle(
                      //     backgroundColor: Constants.primaryColor,
                      //     color: Colors.white,
                      //   ),
                      // )
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        viewmodel.navigateToWallet('BTC');
                      },
                      text: 'BTC',
                      // child: Text(
                      //   'btc',
                      //   style: TextStyle(
                      //       backgroundColor: Constants.primaryColor),
                      // )
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
