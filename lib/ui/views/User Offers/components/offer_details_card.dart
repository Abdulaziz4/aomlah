 import 'package:aomlah/core/app/utils/constants.dart';
 import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserOfferCard extends StatelessWidget {
  final bool isBuy;
  final String stat;
  const UserOfferCard({
    Key? key,
    this.isBuy = true,
    required this.stat ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      width: 351,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Constants.black2dp,
        boxShadow: Constants.shadow,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Row(
            children: [
              isBuy
                  ?Text(" شراء ", style: TextStyle(color: Constants.primaryColor),)
                  :Text(" بيع  ", style: TextStyle(color: Constants.redColor),),

              Text(" BTC",style: TextStyle(color: Colors.white),),
              Spacer(),
              Text(stat, style: TextStyle(color: Constants.darkBlue, fontSize:14 ),),

              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  // locator<NavigationService>()
                  //     .navigateTo(Routes.createOfferView);
                },
                icon: Icon(Icons.arrow_forward_ios,
                  size: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),


          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("السعر",style: TextStyle(color: Color(0xFFC6C6C6)),),
                SizedBox(width: 10,),
                Text("0.21358765 ر.س",style: TextStyle(color: Color(0xFFC6C6C6)),),
                Spacer(),
                Text("المبلغ     ",style: TextStyle(color: Colors.white),),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الكمية",style: TextStyle(color: Color(0xFFC6C6C6)),),
                SizedBox(width: 9,),
                Text("BTC ",style: TextStyle(color: Color(0xFFC6C6C6)),),
                Text("0.21347658",style: TextStyle(color: Color(0xFFC6C6C6)),),

                Spacer(),
                Text("2500 ر.س",style: TextStyle(color: Colors.white),),
                Spacer(),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/icons/profile-icon.svg"),
                Text("عبدالعزيز",style: TextStyle(color: Colors.white, ),),
                Spacer(),
                Text("2021/5/1-14:30pm",style: TextStyle(color: Color(0xFFC6C6C6), fontSize:14 ) ,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            title,
            style: TextStyle(color: Constants.lighBlue)
        ),
        Text(
          subtitle,
          // style: Constants.mediumText,
        ),
      ],
    );
    // Figma Flutter Generator OfferWidget - GROUP

  }
}
