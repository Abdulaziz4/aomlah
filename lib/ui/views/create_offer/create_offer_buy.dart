import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/create_offer/common/custom_card_title.dart';
import 'package:aomlah/ui/views/create_offer/common/custom_menu.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'common/custom_container.dart';

class CreateOfferBuy extends StatefulWidget {
  const CreateOfferBuy({Key? key}) : super(key: key);

  @override
  State<CreateOfferBuy> createState() => _CreateOfferBuyState();
}

class _CreateOfferBuyState extends State<CreateOfferBuy> {
  final cryptoList = ['BTC', 'ETH', 'USDT'];
  final currencyList = ['ر.س', 'USD'];
  String? cListVal, currListVal;
  double margin = 100;

  final TextEditingController _cryptoAmountController = TextEditingController();
  final TextEditingController _minTradeController = TextEditingController();
  final TextEditingController _termsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cListVal ??= cryptoList.first;
    currListVal ??= currencyList.first;


    return ViewModelBuilder<CreateOfferViewModel>.reactive(
      viewModelBuilder: (){return CreateOfferViewModel();},
      builder: (context,viewmodel,_) {
        return BusyOverlay(
          isBusy: viewmodel.isBusy,
          child: SingleChildScrollView(
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
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
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

                ///Amount of Crypto
                CusCardTitle(title: 'الكمية الاجمالية'),

                ///Amount of Crypto text form
                CusContainer(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          cListVal as String,
                          textAlign: TextAlign.center,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          controller: _cryptoAmountController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              hintText: 'ادخل الكمية الاجمالية',
                              border: InputBorder.none),
                          keyboardType: TextInputType.number,

                          // onChanged: (value1)=> setState(() => this.cryptoAmount=value1 as double ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///min trade amount
                CusCardTitle(title: 'الحد الادنى للتبادل'),

                ///min trade amount text form
                CusContainer(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          currListVal as String,
                          textAlign: TextAlign.center,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          controller: _minTradeController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              hintText: 'ادخل الحد الادنى',
                              border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          // onChanged: (value)=> setState(() => this.minTrade=value as double ),
                        ),
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


                            double cryptoAmount =
                                double.parse(_cryptoAmountController.text);
                            double minTrade = double.parse(_minTradeController.text);

                            viewmodel.submitBuyOffer(
                                cListVal.toString(),
                                currListVal.toString(),
                                margin,
                                cryptoAmount,
                                minTrade,
                                _termsController.text);

                          },
                          child: Text(
                            'submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
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
