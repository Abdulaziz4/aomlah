import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xff3D4955),
                        ),
                        top: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        viewmodel.navigateToUserOffers();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25.0),
                        minimumSize: const Size.fromHeight(50),
                        primary: Color(0xff0F1E2C),
                        onPrimary: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/offers_profile.svg"),
                          Container(width: 10),
                          Text("العروض"),
                          Spacer(flex: 3),
                          SvgPicture.asset(
                              "assets/icons/LeftArrow_Profile.svg"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Color(0xff3D4955),
                      ),
                    )),
                    child: ElevatedButton(
                      onPressed: viewmodel.navigateToTrades,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25.0),
                        minimumSize: const Size.fromHeight(50),
                        primary: Color(0xff0F1E2C),
                        onPrimary: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                              "assets/icons/Transaction_profile.svg"),
                          Container(width: 10),
                          Text("عمليات التداول"),
                          Spacer(flex: 3),
                          SvgPicture.asset(
                              "assets/icons/LeftArrow_Profile.svg"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xff3D4955),
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        viewmodel.navigateToWalletInfo();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25.0),
                        minimumSize: const Size.fromHeight(50),
                        primary: Color(0xff0F1E2C),
                        onPrimary: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/Wallet_profile.svg"),
                          Container(width: 10),
                          Text("المحفظة"),
                          Spacer(flex: 3),
                          SvgPicture.asset(
                              "assets/icons/LeftArrow_Profile.svg"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Color(0xff3D4955),
                      ),
                    )),
                    child: ElevatedButton(
                      onPressed: () {
                        viewmodel.navigateToBankAccounts();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25.0),
                        minimumSize: const Size.fromHeight(50),
                        primary: Color(0xff0F1E2C),
                        onPrimary: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/BankAcc_profile.svg"),
                          Container(width: 10),
                          Text("الحسابات البنكية"),
                          Spacer(flex: 3),
                          SvgPicture.asset(
                              "assets/icons/LeftArrow_Profile.svg"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xff3D4955),
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25.0),
                        minimumSize: const Size.fromHeight(50),
                        primary: Color(0xff0F1E2C),
                        onPrimary: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                              "assets/icons/ControlPannel_profile.svg"),
                          Container(width: 10),
                          Text("لوحة التحكم"),
                          Spacer(flex: 3),
                          SvgPicture.asset(
                              "assets/icons/LeftArrow_Profile.svg"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        viewmodel.navigateToSettings();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25.0),
                        minimumSize: const Size.fromHeight(50),
                        primary: Color(0xff0F1E2C),
                        onPrimary: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/Settings_profile.svg"),
                          Container(width: 10),
                          Text("الإعدادات"),
                          Spacer(flex: 3),
                          SvgPicture.asset(
                              "assets/icons/LeftArrow_Profile.svg"),
                        ],
                      ),
                    ),
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
