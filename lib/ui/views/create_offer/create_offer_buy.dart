import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateOfferBuy extends StatefulWidget {
  const CreateOfferBuy({Key? key}) : super(key: key);

  @override
  State<CreateOfferBuy> createState() => _CreateOfferBuyState();
}

class _CreateOfferBuyState extends State<CreateOfferBuy> {
  final cryptoList = ['BTC', 'ETH', 'USDT'];
  String? cListVal;
  final currencyList = ['ر.س', 'USD'];
  String? currListVal;

  @override
  Widget build(BuildContext context) {
    if (cListVal == null) {
      cListVal = cryptoList.first as String;
    };
    if (currencyList == null) {
      currListVal = cryptoList.first as String;
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ///Crypto and Currency type
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: <Widget>[
        //     SizedBox(
        //       width: 20,
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Text('عملة')
        //         // DropdownButton(),
        //       ],
        //     )
        //   ],
        // ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(child: Text('عملة')),
            Expanded(child: Text('مقابل العملة التقليدية'))
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  color: Constants.black3dp,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  padding: EdgeInsets.all(16),
                  child: DropdownButtonHideUnderline(child: menuCryptoButton())),
            ),
            Expanded(
              child: Container(
                  color: Constants.black3dp,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                  padding: EdgeInsets.all(16),
                  child: DropdownButtonHideUnderline(child: menuCurrencyButton())),
            ),
          ],
        ),

        // Row(
        //   children:  <Widget>[
        //     Column(
        //       children: [
        //
        //       ],
        //     ),
        //     Expanded(child: TextButton(onPressed: null,child: Icon(Icons.email),)),
        //     // Expanded(child: TextButton(onPressed: null,child: Icon(Icons.email),))
        //
        //   ],
        // ),

        ///Amount of Crypto to buy
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            SizedBox(width: 20),
            Text(
              'الكمية الاجمالية',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        Card(
          color: Constants.black3dp,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ListTile(
            // contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 2),
            leading: Text(cListVal as String),
            title: TextField(
              decoration: InputDecoration(
                  hintText: 'ادخل الكمية الاجمالية', border: InputBorder.none),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        // Text(''),

        ///min trade amount
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            SizedBox(width: 20),
            Text(
              'الحد الادنى للتبادل',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        Card(
          color: Constants.black3dp,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ListTile(
            // contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 2),
            leading: Text(currListVal as String),
            title: TextField(
              decoration: InputDecoration(
                  hintText: 'ادخل الحد الادنى', border: InputBorder.none),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
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
    onChanged: (value) => setState(() => this.currListVal = value as String?),
    value: currListVal,
    // isExpanded: true,
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
// class _menuCrypto extends State<CreateOfferBuy>{
//   @override
//   Widget build(BuildContext context) {
//     return Text('data');
//   }

// }
