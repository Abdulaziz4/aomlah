import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_card_title.dart';
import 'package:aomlah/ui/views/withdraw/withdraw_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/utils/constants.dart';
import '../../../core/models/real_time_wallet.dart';
import '../../../core/models/wallet.dart';
import '../../shared/custom_input_field.dart';
import '../../shared/custom_menu.dart';

class WithdrawView extends StatelessWidget {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black1dp,
        title: Text(
          'إجراء عملية تحويل',
          style:
              TextStyle(color: Constants.darkBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: WithdrawViewBody(),
      // bottomSheet: TextButton(onPressed: () {}, child: Text('ddd')),
    );
  }
}

class WithdrawViewBody extends StatefulWidget {
  WithdrawViewBody({Key? key}) : super(key: key);

  @override
  State<WithdrawViewBody> createState() => _WithdrawViewBodyState();
}

class _WithdrawViewBodyState extends State<WithdrawViewBody> {
  final cryptoList = ['BTC'];
  String? cListVal, walletAddress;
  double? cryptoAmount;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    cListVal ??= cryptoList.first;
    final wallet = Provider.of<RealTimeWallet>(context);

    return ViewModelBuilder<WithdrawViewModel>.reactive(
        viewModelBuilder: () => WithdrawViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Form(
              key: _formKey,
              child: Column(
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
                          (wallet.balance * 0.00000001)) {
                        return 'أدخل المبلغ تحت رصيدك';
                      }
                    },
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      cryptoAmount = double.parse(value!);
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'الكمية في محفظتك ' +
                            (wallet.balance * 0.00000001).toString() +
                            ' $cListVal',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Expanded(flex: 1, child: Container()),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          color: Constants.primaryColor,
                          child: TextButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState?.save();
                              int amount = (cryptoAmount! * 100000000).round();
                              var m =
                                  viewmodel.sendTran(walletAddress!, amount);
                            },
                            child: Text(
                              'تحويل',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  DropdownButton menuCryptoButton() => DropdownButton(
        items: cryptoList.map(buildCryptoItems).toList(),
        onChanged: (value) => setState(() => cListVal = value as String?),
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
}
