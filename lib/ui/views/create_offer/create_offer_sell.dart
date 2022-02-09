import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/create_offer/common/custom_card_title.dart';
import 'package:aomlah/ui/views/create_offer/common/custom_menu.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/bitcoin.dart';
import '../../shared/custom_button.dart';
import 'common/custom_container.dart';
import 'common/custom_input_field.dart';

class CreateOfferSell extends StatefulWidget {
  const CreateOfferSell({Key? key}) : super(key: key);

  @override
  State<CreateOfferSell> createState() => _CreateOfferSellState();
}

class _CreateOfferSellState extends State<CreateOfferSell> {
  final cryptoList = ['BTC', 'ETH', 'USDT'];
  final currencyList = ['ر.س', 'USD'];
  String? cListVal, currListVal;
  double margin = 100;
  double? cryptoAmount,minTrade;
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _cryptoAmountController = TextEditingController();
  final TextEditingController _minTradeController = TextEditingController();
  final TextEditingController _termsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double realTimePrice;
    if(currListVal=='ر.س') {
      realTimePrice=Provider.of<Bitcoin>(context).price * (margin/100)*3.75;}
    else {realTimePrice=Provider.of<Bitcoin>(context).price * (margin/100);}

    realTimePrice=double.parse(realTimePrice.toStringAsFixed(3));
    cListVal ??= cryptoList.first;
    currListVal ??= currencyList.first;

    return ViewModelBuilder<CreateOfferViewModel>.reactive(
      viewModelBuilder: (){return CreateOfferViewModel();},
      builder: (context,viewmodel,_) {
        return BusyOverlay(
          isBusy: viewmodel.isBusy,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

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
                    color: Constants.black3dp,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListTile(
                      // contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 2),
                      leading: TextButton(
                          onPressed: () {
                            if (margin < 200) {
                              setState(() {
                                margin++;
                              });
                            }
                            ;
                          },
                          child: Text('+')),

                      title: Center(child: Text(margin.toString() + "%")),
                      trailing: TextButton(
                          onPressed: () {
                            if (margin > 50) {
                              setState(() {
                                margin--;
                              });
                            }
                            ;
                          },
                          child: Text('-')),
                    ),
                  ),
                  ///CryptoPrice Info
                  Row(
                    children: [
                      SizedBox(width: 20,),

                      Text('سعرك هو $realTimePrice $currListVal',style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ), ),
                    ],
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
                      if (value == null || value.isEmpty) return 'Enter Amount';
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
                      if (value == null || value.isEmpty) return 'Enter Amount';
                    },
                    onSaved: (value) {
                      minTrade= double.parse(value!);
                    },

                  ),

                  ///Bank account selection
                  SizedBox(
                    height: 10,
                  ),
                  CusContainer(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(child: Text('الحسابات البنكية')),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: CustomButton(
                                onPressed: () {},
                                text: 'اضف',
                              ),
                            ))
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '*اختر ثلاث حسابات كحد اقصى',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(child: Text('b1')),
                            Expanded(child: Text('b2')),
                            Expanded(child: Text('b3')),
                          ],
                        ),
                      ],
                    ),
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
                  Container(
                    color: Constants.primaryColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {

                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState?.save();


                              viewmodel.submitSellOffer(
                                  cListVal.toString(),
                                  currListVal.toString(),
                                  margin,
                                  cryptoAmount!,
                                  minTrade!,
                                  _termsController.text);
                            },
                            child: Text(
                              'submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  DropdownButton menuCryptoButton() => DropdownButton(
        items: cryptoList.map(buildCryptoItems).toList(),
        onChanged: (value) => setState(() => this.cListVal = value as String?),
        value: cListVal,
        // isExpanded: true,
      );

  DropdownButton menuCurrencyButton() => DropdownButton(
        items: currencyList.map(buildCryptoItems).toList(),
        onChanged: (value) =>
            setState(() => this.currListVal = value as String?),
        value: currListVal,
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
