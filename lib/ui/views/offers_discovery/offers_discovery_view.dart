import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked_services/stacked_services.dart';

class OffersDiscoveryView extends StatelessWidget {
  const OffersDiscoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         locator<NavigationService>().navigateTo(Routes.createOfferView);
        //       },
        //       icon: Icon(Icons.add),
        //     ),
        //   ],
        //   automaticallyImplyLeading: false,
        // ),
        appBar: AppBar(
          title: Text("التداول"),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            labelStyle: Theme.of(context).textTheme.headline4,
            tabs: const [
              Tab(text: "شراء"),
              Tab(text: "بيع"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TabBarView(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Constants.black2dp,
                      boxShadow: Constants.shadow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/profile-icon.svg"),
                            SizedBox(width: 5),
                            Text("عبدالعزيز"),
                            Spacer(),
                            Text("2021/5/1")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildInfoItem("السعر", "121,41241,124 ر.س"),
                                buildInfoItem("الكمية", "0.1245 BTC"),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildInfoItem("الحد الادنى", "2000 ر.س"),
                                CustomButton(
                                  onPressed: () {},
                                  text: "شراء",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(Icons.deck),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Constants.smallText.copyWith(
            color: Constants.darkBlue,
          ),
        ),
        Text(
          subtitle,
          style: Constants.mediumText,
        ),
      ],
    );
  }
}
