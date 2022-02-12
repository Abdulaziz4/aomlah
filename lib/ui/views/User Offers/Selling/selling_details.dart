import 'package:flutter/material.dart';

import '../../../../core/app/utils/constants.dart';
import '../../../shared/rounded_input_field.dart';


class SellingDetails extends StatefulWidget {
  const SellingDetails({Key? key}) : super(key: key);

  @override
  _SellingDetailsState createState() => _SellingDetailsState();
}

class _SellingDetailsState extends State<SellingDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
            height: 90,
            width: 350,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('بيع ', style: TextStyle(color: Constants.redColor, fontSize: 19),),
                    Text(' BTC ', style: TextStyle(color: Colors.white, fontSize: 19,),),
                    Text('مقابل ر.س', style: TextStyle(color: Colors.white, fontSize: 19),),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('السعر', style: TextStyle(color: Colors.white, fontSize: 19),),
                    Spacer(),
                    Text('144,442,345 ر.س', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('هامش السعر', style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text('%102', style: TextStyle(color: Colors.white, fontSize: 19),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('الكمية', style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text(' BTC ', style: TextStyle(color: Colors.white, fontSize: 19),),
                    Text('0.213', style: TextStyle(color: Colors.white, fontSize: 19),
                    ),


                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text('الحد الأدنى', style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Spacer(),
                    Text('2000 ر.س', style: TextStyle(color: Colors.white, fontSize: 19),),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('الحسابات البنكية',style: TextStyle(color: Colors.white, fontSize: 19),),
                //SvgPicture.asset("assets/icons/profile-icon.svg"),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text('الشروط والأحكام',style: TextStyle(color: Colors.white, fontSize: 19),),
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
