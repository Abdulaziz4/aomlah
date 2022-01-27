import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateOfferBuy extends StatelessWidget {
  const CreateOfferBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('عملة')
                // DropdownButton(),
              ],
            )
          ],
          
        ),
        ///Amount of Crypto to buy
        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: const <Widget>[
            SizedBox(width: 20),
            Text('الكمية الاجمالية',style: TextStyle(
              fontWeight: FontWeight.bold
            ), textAlign: TextAlign.right,
            ),
          ],
        ),
        Card(
          color: Constants.black3dp,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ListTile(
            // contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 2),
            leading: Text('BTC'),
            title: TextField(
              decoration: InputDecoration(
                hintText: 'ادخل الكمية الاجمالية',
                border: InputBorder.none
              ),
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
            Text('الحد الادنى للتبادل',style: TextStyle(
                fontWeight: FontWeight.bold
            ), textAlign: TextAlign.right,
            ),
          ],
        ),
        Card(
          color: Constants.black3dp,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ListTile(
            // contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 2),
            leading: Text('ر.س'),
            title: TextField(
              decoration: InputDecoration(
                  hintText: 'ادخل الحد الادنى',
                  border: InputBorder.none
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }

}