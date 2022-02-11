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
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  // locator<NavigationService>()
                  //     .navigateTo(Routes.createOfferView);
                },
                icon: Icon(Icons.arrow_back_ios,
                  size: 13,
                  color: Colors.white,
                ),
              ),
              Text(stat, style: TextStyle(color: Constants.darkBlue, fontSize:14 ),),
              Spacer(),


              Text(" BTC",style: TextStyle(color: Colors.white),),

              isBuy
                  ?Text(" شراء ", style: TextStyle(color: Constants.primaryColor),)
                  :Text(" بيع  ", style: TextStyle(color: Constants.redColor),),

            ],
          ),


          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("المبلغ",style: TextStyle(color: Colors.white),),
                Spacer(),
                Text("ر.س",style: TextStyle(color: Color(0xFFC6C6C6)),),
                Text("  0.21358765 ",style: TextStyle(color: Color(0xFFC6C6C6)),),
                SizedBox(width: 10,),
                Text("السعر",style: TextStyle(color: Color(0xFFC6C6C6)),),

              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ر.س",style: TextStyle(color: Colors.white),),
                Text("2500 ",style: TextStyle(color: Colors.white),),
                Spacer(),
                Text("0.21358765 BTC",style: TextStyle(color: Color(0xFFC6C6C6)),),
                SizedBox(width: 10,),
                Text("الكمية",style: TextStyle(color: Color(0xFFC6C6C6)),),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Row(
              children: [
                Text("2021/5/1- 14:30pm",style: TextStyle(color: Color(0xFFC6C6C6), fontSize:14 ) ,),
                Spacer(),
                Text("عبدالعزيز",style: TextStyle(color: Colors.white),),
                SvgPicture.asset("assets/icons/profile-icon.svg"),

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
