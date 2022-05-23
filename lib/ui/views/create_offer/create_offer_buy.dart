import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_card_title.dart';
import 'package:aomlah/ui/shared/custom_menu.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../shared/custom_input_field.dart';
import '../../shared/custom_container.dart';

class CreateOfferBuy extends StatefulWidget {
  const CreateOfferBuy({Key? key}) : super(key: key);

  @override
  State<CreateOfferBuy> createState() => _CreateOfferBuyState();
}

class _CreateOfferBuyState extends State<CreateOfferBuy> {
  final cryptoList = ['BTC'];
  final currencyList = ['ر.س'];
  String? cListVal, currListVal;
  double margin = 100;
  double? cryptoAmount, minTrade;

  final TextEditingController _cryptoAmountController = TextEditingController();
  final TextEditingController _minTradeController = TextEditingController();
  final TextEditingController _termsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double realTimePrice;
    if (currListVal == 'ر.س') {
      realTimePrice =
          Provider.of<Bitcoin>(context).price * (margin / 100) * 3.75;
    } else {
      realTimePrice = Provider.of<Bitcoin>(context).price * (margin / 100);
    }

    realTimePrice = double.parse(realTimePrice.toStringAsFixed(3));

    cListVal ??= cryptoList.first;
    currListVal ??= currencyList.first;

    return ViewModelBuilder<CreateOfferViewModel>.reactive(
        viewModelBuilder: () {
      return CreateOfferViewModel();
    }, builder: (context, viewmodel, _) {
      return BusyOverlay(
        isBusy: viewmodel.isBusy,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),

                ///Crypto and Currency type
                Row(
                  children: const <Widget>[
                    SizedBox(width: 20),
                    Expanded(child: Text('عملة')),
                    Expanded(child: Text('مقابل العملة التقليدية'))
                  ],
                ),
                Row(
                  children: <Widget>[
                    CusMenu(
                        dropdownButton: menuCryptoButton(),
                        menuMargin: EdgeInsets.fromLTRB(20, 0, 20, 10)),
                    CusMenu(
                        dropdownButton: menuCurrencyButton(),
                        menuMargin: EdgeInsets.fromLTRB(20, 0, 10, 10)),
                  ],
                ),

                ///Price Margin
                CusCardTitle(title: 'نسبة هامش السعر '),

                ///Price Margin value
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Constants.black3dp,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: TextButton(
                        onPressed: () {
                          if (margin < 200) {
                            setState(() {
                              margin++;
                            });
                          }
                        },
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    title: Center(child: Text(margin.toString() + "%")),
                    trailing: TextButton(
                        onPressed: () {
                          if (margin > 50) {
                            setState(() {
                              margin--;
                            });
                          }
                        },
                        child: Text(
                          '-',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),

                ///CryptoPrice Info
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'سعرك هو $realTimePrice $currListVal',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                ///Amount of Crypto
                CusCardTitle(title: 'الكمية الاجمالية'),

                ///Amount of Crypto text form
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
                    }
                    return null;
                  },
                  controller: _cryptoAmountController,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    cryptoAmount = double.parse(value!);
                  },
                ),

                ///min trade amount
                CusCardTitle(title: 'الحد الادنى للتبادل'),

                ///min trade amount text form
                CustomInputField(
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$currListVal',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  hintText: 'ادخل الحد الادنى',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الكمية الاجمالية';
                    } else if (double.parse(value) <= 0) {
                      return 'الرجاء ادخال كميه صحيحه';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    minTrade = double.parse(value!);
                  },
                ),

                ///Trade Terms and Conditions

                CusCardTitle(title: 'الشروط والاحكام'),

                ///Trade Terms and Conditions text form
                CusContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _termsController,
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintText: 'ادخل الشروط والاحكام',
                              border: InputBorder.none),
                          keyboardType: TextInputType.text,
                          // onChanged: (value)=> setState(() => this.terms=value),
                        ),
                      ),
                    ],
                  ),
                ),

                ///Submit Form
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Expanded(
                      child: Container(
                        color: Constants.primaryColor,
                        margin: EdgeInsets.all(20),
                        child: TextButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _formKey.currentState?.save();

                            viewmodel.submitBuyOffer(
                                cListVal.toString(),
                                currListVal.toString(),
                                margin,
                                cryptoAmount!,
                                minTrade!,
                                _termsController.text);
                          },
                          child: Text(
                            'إنشاء',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  DropdownButton menuCurrencyButton() => DropdownButton(
        items: currencyList.map(buildItems).toList(),
        onChanged: (value) => setState(() => currListVal = value as String?),
        value: currListVal,
      );

  DropdownButton menuCryptoButton() => DropdownButton(
        items: cryptoList.map(buildItems).toList(),
        onChanged: (value) => setState(() => cListVal = value as String?),
        value: cListVal,
      );

  DropdownMenuItem<String> buildItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
