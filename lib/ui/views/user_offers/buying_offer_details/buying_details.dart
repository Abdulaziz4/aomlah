import 'package:flutter/material.dart';
import '../../../../core/app/utils/constants.dart';

class BuyingDetails extends StatefulWidget {
  const BuyingDetails({Key? key}) : super(key: key);

  @override
  _BuyingDetailsState createState() => _BuyingDetailsState();
}

class _BuyingDetailsState extends State<BuyingDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 110,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'رقم العرض',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                Text(
                  '123456789',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ],
            ),
          ),
          Container(
              width: 358,
              height: 1,
              decoration: BoxDecoration(
                color: Color.fromRGBO(22, 167, 158, 1),
              )),
          Container(
            height: 110,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'شراء ',
                      style: TextStyle(
                          color: Constants.primaryColor, fontSize: 19),
                    ),
                    Text(
                      ' BTC ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      'مقابل ر.س',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'السعر',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text(
                      '144,442,345 ر.س',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'هامش السعر',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text(
                      '%102',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              width: 358,
              height: 1,
              decoration: BoxDecoration(
                color: Color.fromRGBO(22, 167, 158, 1),
              )),
          Container(
            height: 110,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'الكمية',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text(
                      ' BTC ',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Text(
                      '0.213',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'الحد الأدنى',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text(
                      '2000 ر.س',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              width: 358,
              height: 1,
              decoration: BoxDecoration(
                color: Color.fromRGBO(22, 167, 158, 1),
              )),
          Container(
            height: 110,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'الشروط والأحكام',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                Text(
                  "ما أقبل اس تي سي باي",
                  style: TextStyle(color: Colors.grey, fontSize: 19),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
