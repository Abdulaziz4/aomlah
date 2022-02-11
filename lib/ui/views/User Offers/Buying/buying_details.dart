
import 'package:flutter/material.dart';

import '../../../../core/app/utils/constants.dart';

import '../../../shared/rounded_input_field.dart';

class BuyingDetails extends StatefulWidget {
  const BuyingDetails ({Key? key}) : super(key: key);

  @override
  _BuyingDetailsState createState() => _BuyingDetailsState();
}

class _BuyingDetailsState extends State<BuyingDetails> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
            height: 110,
            width: 350,
            child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('رقم العرض', style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              Text('123456789', style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ],
          ),
          ),



          Container(
              width: 358,
              height: 1,
              decoration: BoxDecoration(
                color : Color.fromRGBO(22, 167, 158, 1),
              )
          ),



          Container(
            height: 110,
            width: 350,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('ر.س', style: TextStyle(color: Colors.white, fontSize: 19),),
                    Text('مقابل', style: TextStyle(color: Colors.white, fontSize: 19),),
                    Text('BTC', style: TextStyle(color: Colors.white, fontSize: 19,),),
                    Text('شراء', style: TextStyle(color: Constants.primaryColor, fontSize: 19),),



                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('ر.س ', style: TextStyle(color: Colors.white, fontSize: 19),),
                    Text('144,442,345 ', style: TextStyle(color: Colors.white, fontSize: 19),),
                    Spacer(),
                    Text('السعر', style: TextStyle(color: Colors.white, fontSize: 19),),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('%102', style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text('هامش السعر', style: TextStyle(color: Colors.white, fontSize: 19),
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
                color : Color.fromRGBO(22, 167, 158, 1),
              )
          ),



          Container(
            height: 110,
            width: 350,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('0.213 BTC', style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text('الكمية', style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('ر.س', style: TextStyle(color: Colors.white, fontSize: 19),),
                    Text('2000', style: TextStyle(color: Colors.white, fontSize: 19),),

                    Spacer(),
                    Text('الحد الأدنى', style: TextStyle(color: Colors.white, fontSize: 19),
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
                color : Color.fromRGBO(22, 167, 158, 1),
              )
          ),



          Container(
            height: 110,
            width: 350,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('الشروط والأحكام',style: TextStyle(color: Colors.white, fontSize: 19),),
                RoundedInputField(
                  hintText: "ما أقبل اس تي سي باي",
                  label: 'الشروط والأحكام',
                ),
              ],
            ),

          ),



          // Positioned(
          //     top: 214,
          //     left: 22,
          //     child: Container(
          //         width: 358,
          //         height: 1,
          //         decoration: BoxDecoration(
          //           color : Color.fromRGBO(22, 167, 158, 1),
          //         )
          //     )
          // ),




          // Container(
          //   height: 110,
          //   width: 350,
          //   child:
          //   Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('details', style: TextStyle(color: Colors.white, fontSize: 19),
          //       ),
          //       Text('details', style: TextStyle(color: Colors.white, fontSize: 19),
          //       ),
          //     ],
          //   ),
          // ),



        ],
      ),

    );

  }
}
