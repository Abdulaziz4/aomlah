import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/ui/views/profile/components/navigation_list_tile.dart';
import 'package:aomlah/ui/views/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AomlahUser>(context);

    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("الحساب الشخصي"),
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        color: Color(0xff0F1E2C),
                      ),
                      Positioned(
                        child: SvgPicture.asset("assets/icons/ProfilePic.svg"),
                        bottom: 25,
                        right: 20,
                      ),
                      Positioned(
                        child: Text(
                          user.name,
                          style: Constants.smallText,
                        ),
                        bottom: 75,
                        right: 120,
                      ),
                      Positioned(
                        child: Text(
                          viewmodel.email,
                          style: Constants.smallText,
                        ),
                        bottom: 50,
                        right: 120,
                      ),
                      Positioned(
                        child: buildStateContainer(user.isOnline),
                        bottom: 12,
                        right: 120,
                      ),
                      Positioned(
                        child: SvgPicture.asset("assets/icons/verifyBadge.svg"),
                        bottom: 100,
                        left: 0,
                      ),
                    ],
                  ),
                  NavigationListTile(
                    onPress: viewmodel.navigateToUserOffers,
                    leadingIcon: "assets/icons/offers_profile.svg",
                    title: "العروض",
                  ),
                  NavigationListTile(
                    onPress: viewmodel.navigateToTrades,
                    leadingIcon: "assets/icons/Transaction_profile.svg",
                    title: "عمليات التداول",
                  ),
                  NavigationListTile(
                    onPress: viewmodel.navigateToWalletInfo,
                    leadingIcon: "assets/icons/Wallet_profile.svg",
                    title: "المحفظة",
                  ),
                  NavigationListTile(
                    onPress: viewmodel.navigateToBankAccounts,
                    leadingIcon: "assets/icons/BankAcc_profile.svg",
                    title: "الحسابات البنكية",
                  ),
                  NavigationListTile(
                    onPress: () {},
                    leadingIcon: "assets/icons/ControlPannel_profile.svg",
                    title: "لوحة التحكم",
                  ),
                  NavigationListTile(
                    onPress: viewmodel.navigateToSettings,
                    leadingIcon: "assets/icons/Settings_profile.svg",
                    title: "الإعدادات",
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildStateContainer(bool isOnline) {
    return Container(
      decoration: BoxDecoration(
        color: isOnline ? Colors.green : Constants.redColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      child: Text(
        isOnline ? "متصل" : "غير متصل",
        style: Constants.verySmallText,
      ),
    );
  }
}
