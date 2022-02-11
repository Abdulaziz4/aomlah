import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersCard extends StatelessWidget {
  final bool isBuy;
  const OffersCard({
    Key? key,
    this.isBuy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153,
      width: 351,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Constants.black2dp,
        boxShadow: Constants.shadow,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,

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
              Spacer(),
              Text("مقابل ر.س",style: TextStyle(color: Colors.white),),
              Text(" BTC",style: TextStyle(color: Colors.white),),

              isBuy
                  ?Text(" شراء ", style: TextStyle(color: Constants.primaryColor),)
                  :Text(" بيع  ", style: TextStyle(color: Constants.redColor),),

            ],
          ),

          Text(" ر.س 144,579,836 ",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("0,4567899 BTC",style: TextStyle(color: Colors.white),),
                Spacer(),
                Text("الكمية الإجمالية",style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" ر.س ",style: TextStyle(color: Colors.white),),
                Text(" 2000",style: TextStyle(color: Colors.white),),
                Spacer(),
                Text("الحد الأدنى",style: TextStyle(color: Colors.white),),
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
