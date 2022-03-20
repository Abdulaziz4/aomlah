import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class DisputeCard extends StatelessWidget {
  const DisputeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(Routes.disputeDetailsView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.black2dp,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: 8,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "رقم التداول",
                          style: Constants.smallText.copyWith(
                            color: Constants.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "1212   ",
                          style: Constants.smallText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "في الانتظار",
                      style: Constants.smallText
                          .copyWith(color: Constants.darkBlue, fontSize: 14),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "السبب",
                      style: Constants.smallText.copyWith(
                        color: Constants.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 52,
                    ),
                    Text(
                      "لا أريد إكمال العملية     ",
                      style: Constants.smallText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "2022-04-01   4:30pm",
                      style: Constants.smallText.copyWith(
                        color: Color(0xFFC6C6C6),
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
