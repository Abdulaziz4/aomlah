import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/views/user_offers/buying_offer_details/buying_offer_details_view.dart';
import 'package:flutter/material.dart';
import '../selling_offer_details/selling_offer_details.dart';

class UserOffersCard extends StatelessWidget {
  final bool isBuy;
  const UserOffersCard({
    Key? key,
    this.isBuy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
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
                  ? Text(
                      " شراء ",
                      style: Constants.smallText.copyWith(color: Constants.primaryColor),
                    )
                  : Text(
                      " بيع  ",
                      style: Constants.smallText.copyWith(color: Constants.redColor),
                    ),
              Text(
                " BTC ",
                style: Constants.smallText.copyWith(color: Colors.white),
              ),
              Text(
                "مقابل ر.س",
                style: Constants.smallText.copyWith(color: Colors.white),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if(isBuy){
                          return BuyingOfferDetails();
                        }else
                        return SellingOfferDetails();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            "144,579,836 ر.س",
            style: Constants.smallText.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الكمية الإجمالية",
                style: Constants.smallText.copyWith(color: Colors.white),
              ),
              Spacer(),
              Text(
                " BTC ",
                style: Constants.smallText.copyWith(color: Colors.white),
              ),
              Text(
                "0,4567899",
                style: Constants.smallText.copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الحد الأدنى",
                style: Constants.smallText.copyWith(color: Colors.white),
              ),
              Spacer(),
              Text(
                "2000 ر.س",
                style: Constants.smallText.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
