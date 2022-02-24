import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/models/transactions.dart';
import 'package:aomlah/ui/shared/rounded_button.dart';
import 'package:aomlah/ui/views/wallet/common/conversion_button.dart';
import 'package:aomlah/ui/views/wallet/common/transaction_body.dart';
import 'package:aomlah/ui/views/wallet/common/transaction_header.dart';
import 'package:aomlah/ui/views/wallet/common/wallet_container.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/utils/constants.dart';
import '../../../core/models/bitcoin.dart';
import '../../../core/models/eth_real_time_wallet.dart';
import '../../../core/models/real_time_wallet.dart';
import 'common/transaction_card.dart';
import 'package:clipboard/clipboard.dart';

class WalletInfoView extends StatefulWidget {
  const WalletInfoView({Key? key}) : super(key: key);

  @override
  State<WalletInfoView> createState() => _WalletInfoViewState();
}

class _WalletInfoViewState extends State<WalletInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black1dp,
        title: Text('محفظتك',
            style: TextStyle(
                color: Constants.darkBlue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: WalletInfoViewBody(),
    );
  }
}

class WalletInfoViewBody extends StatefulWidget {
  const WalletInfoViewBody({Key? key}) : super(key: key);

  @override
  State<WalletInfoViewBody> createState() => _WalletInfoViewBodyState();
}

class _WalletInfoViewBodyState extends State<WalletInfoViewBody> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletInfoViewModel>.reactive(
        viewModelBuilder: () => WalletInfoViewModel(),
        builder: (context, viewmodel, _) {
          final wallet;
          final String cryptoType =
              ModalRoute.of(context)!.settings.arguments as String;
          double walletBalance;
          CryptoTypes types;
          double realTimePrice;
          double convertToBTC(balance) => (balance / 100000000);
          double convertWeitoETH(balance) =>
              (balance / (1000000000000000000.0));
          double walletBalanceSAR;

          if (cryptoType == 'BTC') {
            types = CryptoTypes.btc;
            wallet = Provider.of<RealTimeWallet>(context);
            walletBalance = convertToBTC(wallet.balance);
            realTimePrice = Provider.of<Bitcoin>(context).price;
            walletBalanceSAR = double.parse(
                (convertToBTC(wallet.balance * realTimePrice) * 3.75)
                    .toStringAsFixed(2));
          } else {
            types = CryptoTypes.eth;

            wallet = Provider.of<EthRealTimeWallet>(context);
            walletBalance = convertWeitoETH(wallet.balance);

            ///Change to ETH
            realTimePrice = Provider.of<Bitcoin>(context).price;

            walletBalanceSAR = double.parse(
                (convertWeitoETH(wallet.balance * realTimePrice) * 3.75)
                    .toStringAsFixed(2));
          }
          return Column(
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
                          '$cryptoType ',
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          walletBalance.toString(),
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
                          walletBalanceSAR.toString(),
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
                        Flexible(child: Text(wallet.address)),
                        TextButton(
                            onPressed: () {
                              FlutterClipboard.copy(wallet.address)
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
              Expanded(flex: 1, child: transactionType(wallet, types)),
            ],
          );
        });
  }

  transactionType(wallet, CryptoTypes types) {
    if (types == CryptoTypes.btc) {
      return transactionsWidget(wallet, types);
    } else {
      return transactionsWidgetEth(wallet, types);
    }
  }

  transactionsWidget(RealTimeWallet wallet, CryptoTypes types) {
    if (types != CryptoTypes.btc) return;
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

  transactionsWidgetEth(EthRealTimeWallet wallet, CryptoTypes types) {
    if (types != CryptoTypes.eth) return;
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
                        cryptoType: types,
                        transaction: e,
                        address: wallet.address),
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
}
