import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/models/ethereum.dart';
import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/ui/views/wallet/wallet_info.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/app/utils/constants.dart';
import '../../../core/models/eth_real_time_wallet.dart';
import 'common/transaction_body.dart';
import 'common/transaction_card.dart';
import 'common/transaction_header.dart';

class EthWalletInfoView extends StatefulWidget {
  const EthWalletInfoView({Key? key}) : super(key: key);

  @override
  _EthWalletInfoViewState createState() => _EthWalletInfoViewState();
}

class _EthWalletInfoViewState extends WalletInfoInterface<EthWalletInfoView> {
  @override
  WalletInfo getWalletInfo(BuildContext context) {
    final wallet = Provider.of<EthRealTimeWallet>(context);
    double walletBalance = convertWeiToETH(wallet.balance * 1.0);
    double realTimePrice = Provider.of<Ethereum>(context).price;
    double walletBalanceSAR = double.parse(
        (convertWeiToETH(wallet.balance * realTimePrice) * 3.75)
            .toStringAsFixed(2));
    return WalletInfo(
        wallet: wallet,
        cryptoType: "ETH",
        types: CryptoTypes.ethereum,
        walletBalance: walletBalance,
        walletBalanceSAR: walletBalanceSAR);
  }

  @override
  Widget transactionWidget(RealTimeWallet wallet, CryptoTypes types) {
    if (wallet.transactions == null || wallet.transactions!.isEmpty) {
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

  double convertWeiToETH(double balance) {
    return (balance / (1000000000000000000.0));
  }
}
