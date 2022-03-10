import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_card_title.dart';
import 'package:aomlah/ui/views/withdraw/withdraw_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app/utils/constants.dart';
import '../../../core/models/eth_real_time_wallet.dart';
import '../../../core/models/real_time_wallet.dart';
import '../../shared/custom_input_field.dart';
import '../../shared/custom_menu.dart';

class WithdrawView extends StatefulWidget {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  State<WithdrawView> createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> {
  final _formKey = GlobalKey<FormState>();
  final cryptoList = ['BTC', 'ETH'];
  String? cListVal, walletAddress;
  double? cryptoAmount;
  CryptoTypes? types;

  @override
  Widget build(BuildContext context) {
    cListVal ??= cryptoList.first;
    types ??= CryptoTypes.btc;

    final walletBTC = Provider.of<BtcRealTimeWallet>(context);
    final walletEth = Provider.of<EthRealTimeWallet>(context);

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
                        } else if (double.parse(value) >
                            (walletEth.balance / 1000000000000000000.0)) {
                          return 'أدخل المبلغ تحت رصيدك';
                        }
                      },
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (types == CryptoTypes.btc) {
                          cryptoAmount = double.parse(value!) * 100000000;
                        } else if (types == CryptoTypes.eth) {
                          cryptoAmount =
                              double.parse(value!) * 1000000000000000000.0;
                        }
                      },
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        walletBalanceText(walletBTC, walletEth),
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
              types = CryptoTypes.btc;
            } else if (value == cryptoList[1]) {
              types = CryptoTypes.eth;
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

  walletBalanceText(BtcRealTimeWallet walletBTC, EthRealTimeWallet walletEth) {
    if (types == CryptoTypes.btc) {
      return Text(
        'الكمية في محفظتك ' +
            (walletBTC.balance * 0.00000001).toString() +
            ' $cListVal',
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      );
    } else if (types == CryptoTypes.eth) {
      return Text(
        'الكمية في محفظتك ' +
            (walletEth.balance * 0.000000000000000001).toString() +
            ' $cListVal',
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      );
    }
  }
}
