import 'dart:math';

import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/enums/token_decimals.dart';
import 'package:aomlah/core/models/usdt_real_time_wallet.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_card_title.dart';
import 'package:aomlah/ui/views/withdraw/withdraw_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app/utils/constants.dart';
import '../../../core/models/bat_real_time_wallet.dart';
import '../../../core/models/eth_real_time_wallet.dart';
import '../../../core/models/btc_real_time_wallet.dart';
import '../../../core/models/uni_real_time_wallet.dart';
import '../../shared/custom_input_field.dart';
import '../../shared/custom_menu.dart';

class WithdrawView extends StatefulWidget {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  State<WithdrawView> createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> {
  final _formKey = GlobalKey<FormState>();
  final cryptoList = ['BTC', 'ETH', 'USDT', 'UNI', 'BAT'];
  String? cListVal, walletAddress;
  double? cryptoAmount;
  CryptoTypes? types;

  @override
  Widget build(BuildContext context) {
    cListVal ??= cryptoList.first;
    types ??= CryptoTypes.bitcoin;

    final walletBTC = Provider.of<BtcRealTimeWallet>(context);
    final walletEth = Provider.of<EthRealTimeWallet>(context);
    final walletUsdt = Provider.of<UsdtRealTimeWallet>(context);
    final walletUni = Provider.of<UniRealTimeWallet>(context);
    final walletBat = Provider.of<BatRealTimeWallet>(context);

    walletBalanceText() {
      String cryptoBalance = '';
      if (types == CryptoTypes.bitcoin) {
        cryptoBalance = getBalance(walletBTC.balance, 8) + ' $cListVal';
      } else if (types == CryptoTypes.ethereum) {
        cryptoBalance =
            getBalance(walletEth.balance, TokenDecimals.ethTokenDecimals) +
                ' $cListVal';
      } else if (types == CryptoTypes.usdt) {
        cryptoBalance =
            getBalance(walletUsdt.balance, TokenDecimals.usdtTokenDecimals) +
                ' $cListVal';
      } else if (types == CryptoTypes.uni) {
        cryptoBalance =
            getBalance(walletUni.balance, TokenDecimals.uniTokenDecimals) +
                ' $cListVal';
      } else if (types == CryptoTypes.bat) {
        cryptoBalance =
            getBalance(walletBat.balance, TokenDecimals.batTokenDecimals) +
                ' $cListVal';
      }
      return Text(
        'الكمية في محفظتك ' + cryptoBalance,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      );
    }

    return ViewModelBuilder<WithdrawViewModel>.reactive(
        viewModelBuilder: () => WithdrawViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Form(
              key: _formKey,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Constants.black1dp,
                  title: Text(
                    'إجراء عملية تحويل',
                    style: TextStyle(
                        color: Constants.darkBlue, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                ),
                bottomNavigationBar: Container(
                  color: Constants.primaryColor,
                  child: TextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState?.save();
                      int amount = (cryptoAmount!).round();
                      viewmodel.sendTran(walletAddress!, amount, types!);
                    },
                    child: Text(
                      'تحويل',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    ///Address Input Form
                    CusCardTitle(title: 'عنوان المحفظة'),
                    CustomInputField(
                      hintText: 'ادخل عنوان المحفظة',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال العنوان';
                        } else if (value.length < 30) {
                          return 'الرجاء ادخال عنوان صحيح';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        walletAddress = value!;
                      },
                    ),

                    /// Cryptocurrency Selection Meny
                    CusCardTitle(title: 'العملة'),
                    Row(
                      children: [
                        CusMenu(
                            dropdownButton: menuCryptoButton(),
                            menuMargin: EdgeInsets.fromLTRB(20, 0, 20, 10)),
                      ],
                    ),

                    /// Crypto amount input form
                    CusCardTitle(title: 'الكمية'),
                    CustomInputField(
                      hintText: 'ادخل الكمية الاجمالية',
                      suffix: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$cListVal',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال الكمية الاجمالية';
                        } else if (double.parse(value) <= 0) {
                          return 'الرجاء ادخال كميه صحيحه';
                        } else if (types == CryptoTypes.ethereum &&
                            double.parse(value) >
                                (walletEth.balance /
                                    (pow(10, TokenDecimals.ethTokenDecimals) *
                                        1.0))) {
                          return 'أدخل المبلغ تحت رصيدك';
                        } else if (types == CryptoTypes.bitcoin &&
                            double.parse(value) >
                                (walletBTC.balance / (pow(10, 8) * 1.0))) {
                          return 'أدخل المبلغ تحت رصيدك';
                        } else if (types == CryptoTypes.usdt &&
                            double.parse(value) >
                                (walletUsdt.balance /
                                    (pow(10, TokenDecimals.usdtTokenDecimals) *
                                        1.0))) {
                          return 'أدخل المبلغ تحت رصيدك';
                        } else if (types == CryptoTypes.uni &&
                            double.parse(value) >
                                (walletUni.balance /
                                    (pow(10, TokenDecimals.uniTokenDecimals) *
                                        1.0))) {
                          return 'أدخل المبلغ تحت رصيدك';
                        } else if (types == CryptoTypes.bat &&
                            double.parse(value) >
                                (walletBat.balance /
                                    (pow(10, TokenDecimals.batTokenDecimals) *
                                        1.0))) {
                          return 'أدخل المبلغ تحت رصيدك';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (types == CryptoTypes.bitcoin) {
                          cryptoAmount = double.parse(value!) * pow(10, 8);
                        } else if (types == CryptoTypes.ethereum) {
                          cryptoAmount = double.parse(value!) *
                              pow(10, TokenDecimals.ethTokenDecimals);
                        } else if (types == CryptoTypes.usdt) {
                          cryptoAmount = double.parse(value!) *
                              pow(10, TokenDecimals.usdtTokenDecimals);
                        } else if (types == CryptoTypes.uni) {
                          cryptoAmount = double.parse(value!) *
                              pow(10, TokenDecimals.uniTokenDecimals);
                        } else if (types == CryptoTypes.bat) {
                          cryptoAmount = double.parse(value!) *
                              pow(10, TokenDecimals.batTokenDecimals);
                        }
                      },
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        walletBalanceText(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  DropdownButton menuCryptoButton() => DropdownButton(
        items: cryptoList.map(buildCryptoItems).toList(),
        onChanged: (value) => {
          setState(() {
            cListVal = (value as String?);
            if (value == cryptoList[0]) {
              types = CryptoTypes.bitcoin;
            } else if (value == cryptoList[1]) {
              types = CryptoTypes.ethereum;
            } else if (value == cryptoList[2]) {
              types = CryptoTypes.usdt;
            } else if (value == cryptoList[3]) {
              types = CryptoTypes.uni;
            } else if (value == cryptoList[4]) {
              types = CryptoTypes.bat;
            }
          })
        },
        value: cListVal,
      );

  DropdownMenuItem<String> buildCryptoItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  String getBalance(double balance, int decimals) {
    return (balance * (1 / pow(10, decimals))).toStringAsFixed(6);
  }
}
