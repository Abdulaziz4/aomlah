import 'package:aomlah/core/app/utils/currency_helper.dart';
import 'package:aomlah/core/enums/token_decimals.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/swap/swap_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app/utils/constants.dart';
import '../../../core/models/bat_real_time_wallet.dart';
import '../../../core/models/eth_real_time_wallet.dart';
import '../../../core/models/uni_real_time_wallet.dart';
import '../../../core/models/usdt_real_time_wallet.dart';
import '../../shared/custom_button.dart';

class SwapCryptocurrencyView extends StatefulWidget {
  const SwapCryptocurrencyView({Key? key}) : super(key: key);

  @override
  _SwapCryptocurrencyViewState createState() => _SwapCryptocurrencyViewState();
}

class _SwapCryptocurrencyViewState extends State<SwapCryptocurrencyView> {
  final _formKey = GlobalKey<FormState>();
  double? tokenAmount1 = 0;
  double? tokenAmount2 = 0;

  String dropdownValue = 'اختر';
  String dropdownValue2 = 'اختر';

  String balance1 = '';
  String balance2 = '';

  final _fromAmountController = TextEditingController();
  final _toAmountController = TextEditingController();

  var items = [
    'اختر',
    'ETH',
    'USDT',
    'UNI',
    'BAT',
  ];
  double tokenExchangeRate1 = 2;
  double tokenExchangeRate2 = 0.5;
  @override
  Widget build(BuildContext context) {
    final walletEth = Provider.of<EthRealTimeWallet>(context);
    final walletUsdt = Provider.of<UsdtRealTimeWallet>(context);
    final walletUni = Provider.of<UniRealTimeWallet>(context);
    final walletBat = Provider.of<BatRealTimeWallet>(context);

    String setBalance(
      String tokenName,
    ) {
      String balance = '';
      String price = '';
      if (tokenName == 'ETH') {
        price = CurrencyHelper.convertToWhole2(
                walletEth.balance, TokenDecimals.ethTokenDecimals)
            .toStringAsFixed(7);
        balance = 'رصيدك هو $price $tokenName';
      }
      if (tokenName == 'USDT') {
        price = CurrencyHelper.convertToWhole2(
                walletUsdt.balance, TokenDecimals.usdtTokenDecimals)
            .toStringAsFixed(7);

        balance = 'رصيدك هو $price $tokenName';
      }
      if (tokenName == 'UNI') {
        price = CurrencyHelper.convertToWhole2(
                walletUni.balance, TokenDecimals.uniTokenDecimals)
            .toStringAsFixed(7);
        balance = 'رصيدك هو $price $tokenName';
      }
      if (tokenName == 'BAT') {
        price = CurrencyHelper.convertToWhole2(
                walletBat.balance, TokenDecimals.batTokenDecimals)
            .toStringAsFixed(7);
        balance = 'رصيدك هو $price $tokenName';
      }
      return balance;
    }

    bool checkBalance(String tokenName, double amount) {
      double balance = 0;

      if (tokenName == 'ETH') {
        return amount >
            CurrencyHelper.convertToWhole2(
                walletEth.balance, TokenDecimals.ethTokenDecimals);
      }
      if (tokenName == 'USDT') {
        return amount >
            CurrencyHelper.convertToWhole2(
                walletUsdt.balance, TokenDecimals.usdtTokenDecimals);
      }
      if (tokenName == 'UNI') {
        return amount >
            CurrencyHelper.convertToWhole2(
                walletUni.balance, TokenDecimals.uniTokenDecimals);
      }
      if (tokenName == 'BAT') {
        return amount >
            CurrencyHelper.convertToWhole2(
                walletBat.balance, TokenDecimals.batTokenDecimals);
      }
      return true;
    }

    ;

    balance1 = setBalance(dropdownValue);
    balance2 = setBalance(dropdownValue2);

    return ViewModelBuilder<SwapCryptocurrencyViewModel>.reactive(
        viewModelBuilder: () => SwapCryptocurrencyViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: false,

            ///
            child: Form(
              key: _formKey,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'تبديل العملات',
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Constants.black2dp,
                        boxShadow: Constants.shadow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// FROM
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'من',
                                style: Constants.largeText
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),

                          /// FROM CONTAINER
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10, bottom: 5),
                            decoration: BoxDecoration(
                              color: Constants.black4dp,
                              boxShadow: Constants.shadow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              children: [
                                ///Selecting Menu
                                Row(
                                  children: [
                                    // Spacer(),
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,

                                        decoration: InputDecoration(
                                            hintText: 'ادخل الكميه',
                                            border: InputBorder.none),
                                        // "1",
                                        style: Constants.largeText
                                            .copyWith(color: Colors.white),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'الرجاء إدخال الكمية الاجمالية';
                                          } else if (double.parse(value) <= 0) {
                                            return 'الرجاء ادخال كميه صحيحه';
                                          } else if (checkBalance(dropdownValue,
                                              double.parse(value))) {
                                            return 'الرجاء ادخال كميه تحت رصيدك';
                                          }
                                          return null;
                                        },
                                        controller: _fromAmountController,
                                        onChanged: (value) {
                                          setState(() {
                                            valueOneChanged(
                                                double.parse(value));
                                          });
                                        },
                                        onSaved: (value) {
                                          tokenAmount1 = double.parse(value!);
                                        },
                                      ),
                                    ),
                                    Dropdown(dropdownValue, viewmodel),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      balance1,
                                      style: Constants.smallText.copyWith(
                                          color: Color(0xFFC6C6C6),
                                          fontSize: 15),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// TO
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'إلى',
                                style: Constants.largeText
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),

                          /// TO CONTAINER
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10, bottom: 5),
                            decoration: BoxDecoration(
                              color: Constants.black4dp,
                              boxShadow: Constants.shadow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,

                                        decoration: InputDecoration(
                                            hintText: 'ادخل الكميه',
                                            border: InputBorder.none),
                                        // "1",
                                        style: Constants.largeText
                                            .copyWith(color: Colors.white),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'الرجاء إدخال الكمية الاجمالية';
                                          } else if (double.parse(value) <= 0) {
                                            return 'الرجاء ادخال كميه صحيحه';
                                          }
                                          return null;
                                        },
                                        controller: _toAmountController,
                                        onChanged: (value) {
                                          valueTwoChanged(double.parse(value));
                                        },
                                        onSaved: (value) {
                                          tokenAmount2 = double.parse(value!);
                                        },
                                      ),
                                    ),
                                    // Text(
                                    //   "14.5254009",
                                    //   style: Constants.largeText
                                    //       .copyWith(color: Colors.white),
                                    // ),
                                    Dropdown(dropdownValue2, viewmodel),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // Spacer(),
                                    // Text(
                                    //   '(0.108%)',
                                    //   style: Constants.smallText.copyWith(
                                    //       color: Constants.primaryColor),
                                    // ),
                                    Text(
                                      balance2,
                                      style: Constants.smallText.copyWith(
                                          color: Color(0xFFC6C6C6),
                                          fontSize: 15),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// TOKEN RATIO
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                ///make get ratio text    ..  ... .... ... /
                                getRatioText(),

                                style: Constants.smallText
                                    .copyWith(color: Color(0xFFC6C6C6)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// INIT SWAP
                    CustomButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (dropdownValue == '' || dropdownValue2 == '') {
                          return;
                        }
                        _formKey.currentState?.save();
                        print(tokenAmount1);
                        print(tokenAmount2);

                        if (dropdownValue == 'ETH') {
                          viewmodel.swapExactEthForToken(
                              dropdownValue2, tokenAmount1!);
                        } else if (dropdownValue2 == 'ETH') {
                          viewmodel.swapExactTokensForETH(
                              dropdownValue, tokenAmount1!);
                        } else {
                          viewmodel.swapExactTokensForTokens(
                              dropdownValue, dropdownValue2, tokenAmount1!);
                        }

                        // print(tokenAmount1);
                        // print(tokenAmount1);
                      },
                      text: 'تبديل',
                      color: Constants.primaryColor,
                      height: 38,
                      width: 218,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget Dropdown(String s, SwapCryptocurrencyViewModel viewmodel) {
    return Container(
      padding: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Constants.black4dp,
        boxShadow: Constants.shadow,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          value: s,
          dropdownColor: Constants.black5dp,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Row(
                children: [
                  Text(
                    items,
                    style: Constants.largeText.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  if (items == 'ETH')
                    Image.asset("assets/icons/eth.png", width: 25),
                  if (items == 'USDT')
                    Image.asset("assets/icons/Tether-USDT-icon.png", width: 25),
                  if (items == 'UNI')
                    Image.asset("assets/icons/uniswap-uni-logo.png", width: 25),
                  if (items == 'BAT')
                    Image.asset("assets/icons/Basic-Attention-Token-icon.png",
                        width: 25),
                ],
              ),
            );
          }).toList(),
          hint: Text('select'),
          onChanged: (String? newValue) {
            setState(() {
              if (s == dropdownValue && newValue != dropdownValue2)
                dropdownValue = newValue!;
              else if (newValue != dropdownValue) dropdownValue2 = newValue!;
              setExchangeRate(viewmodel);
            });
          },
        ),
      ),
    );
  }

  void valueOneChanged(double tokenAmount1) {
    if (dropdownValue != 'اختر' && dropdownValue2 != 'اختر') {
      _toAmountController.text =
          // tokenExchangeRate2.toString();
          (tokenAmount1 / tokenExchangeRate2).toStringAsFixed(5);
    }
  }

  bool checkBalance(String value) {
    return false;
  }

  void valueTwoChanged(double tokenAmount2) {
    _fromAmountController.text =
        (tokenAmount2 / tokenExchangeRate1).toStringAsFixed(5);
    ;
  }

  Future<void> setExchangeRate(SwapCryptocurrencyViewModel viewmodel) async {
    if (dropdownValue != 'اختر' && dropdownValue2 != 'اختر') {
      tokenExchangeRate1 =
          await viewmodel.getExchangeRate(dropdownValue, dropdownValue2, 1);
      tokenExchangeRate2 = 1 / tokenExchangeRate1;
      valueOneChanged(double.parse(_fromAmountController.text));
    }
  }

  String getRatioText() {
    if (dropdownValue != 'اختر' && dropdownValue2 != 'اختر') {
      return "1$dropdownValue ≈ " +
          (1 / tokenExchangeRate2).toStringAsFixed(8) +
          "$dropdownValue2 ";
    } else {
      return '';
    }
  }
}
