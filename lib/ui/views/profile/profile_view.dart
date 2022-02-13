import 'package:aomlah/ui/views/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
// <<<<<<< HEAD
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
              appBar: AppBar(
                title: Text("الحساب الشخصي"),
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
                          child:
                              SvgPicture.asset("assets/icons/ProfilePic.svg"),
                          bottom: 25,
                          right: 20,
                        ),
                        Positioned(
                          child: Text("زياد أحمد"),
                          bottom: 70,
                          right: 120,
                        ),
                        Positioned(
                          child: Text("zyadAhmed@gmail.com"),
                          bottom: 50,
                          right: 120,
                        ),
                        Positioned(
                          child: SvgPicture.asset(
                              "assets/icons/Available_profile.svg"),
                          bottom: 30,
                          right: 120,
                        ),
                        Positioned(
                          child:
                              SvgPicture.asset("assets/icons/verifyBadge.svg"),
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
                                ))),
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
                                    "assets/icons/offers_profile.svg"),
                                Container(width: 10),
                                Text("العروض"),
                                Spacer(flex: 3),
                                SvgPicture.asset(
                                    "assets/icons/LeftArrow_Profile.svg"),
                              ],
                            ))),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xff3D4955),
                          ),
                        )),
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
                                    "assets/icons/Transaction_profile.svg"),
                                Container(width: 10),
                                Text("عمليات التداول"),
                                Spacer(flex: 3),
                                SvgPicture.asset(
                                    "assets/icons/LeftArrow_Profile.svg"),
                              ],
                            ))),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xff3D4955),
                          ),
                        )),
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
                                    "assets/icons/Wallet_profile.svg"),
                                Container(width: 10),
                                Text("المحفظة"),
                                Spacer(flex: 3),
                                SvgPicture.asset(
                                    "assets/icons/LeftArrow_Profile.svg"),
                              ],
                            ))),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xff3D4955),
                          ),
                        )),
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
                                    "assets/icons/BankAcc_profile.svg"),
                                Container(width: 10),
                                Text("الحسابات البنكية"),
                                Spacer(flex: 3),
                                SvgPicture.asset(
                                    "assets/icons/LeftArrow_Profile.svg"),
                              ],
                            ))),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xff3D4955),
                          ),
                        )),
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
                            ))),
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
                                SvgPicture.asset(
                                    "assets/icons/Settings_profile.svg"),
                                Container(width: 10),
                                Text("الإعدادات"),
                                Spacer(flex: 3),
                                SvgPicture.asset(
                                    "assets/icons/LeftArrow_Profile.svg"),
                              ],
                            ))),
                  ],
                ),
              ));
        });
  }
}

//   return Scaffold(
// appBar: AppBar(
//       title: Text("الحساب الشخصي"),
//     ),

//     body:
//     Column(
//       children: <Widget>[

//         Stack(
//           children: <Widget>[
//             Container(
//           height: 150,
//           color: Color(0xff0F1E2C),
//             ),
//             Positioned(

//             child: SvgPicture.asset("assets/icons/ProfilePic.svg"),
//             bottom: 25,
//             right: 20,
//           ),
//           Positioned(
//             child: Text("زياد أحمد"),
//             bottom: 70,
//             right: 120,
//           ),
//           Positioned(
//             child: Text("zyadAhmed@gmail.com"),
//             bottom: 50,
//             right: 120,
//           ),
//           Positioned(
//             child: SvgPicture.asset("assets/icons/Available_profile.svg"),
//             bottom: 30,
//             right: 120,
//           ),
//           Positioned(
//             child: SvgPicture.asset("assets/icons/verifyBadge.svg"),
//             bottom: 120,
//             left: 0,
//           ),
//         ],
//       ),
//       Container(
//           decoration: BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(
//                     width: 2,
//                     color: Color(0xff3D4955),
//                   ),
//                   top: BorderSide(
//                     width: 2,
//                     color: Colors.black,
//                   ))),
//           child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.all(25.0),
//                 minimumSize: const Size.fromHeight(50),
//                 primary: Color(0xff0F1E2C),
//                 onPrimary: Colors.white,
//               ),

//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset("assets/icons/offers_profile.svg"),
//                   Container(width: 10),
//                   Text("العروض"),
//                   Spacer(flex: 3),
//                   SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//                 ],
//               ))),
//       Container(
//           decoration: BoxDecoration(
//               border: Border(
//             bottom: BorderSide(
//               width: 2,
//               color: Color(0xff3D4955),
//             ),
//           )),
//           child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.all(25.0),
//                 minimumSize: const Size.fromHeight(50),
//                 primary: Color(0xff0F1E2C),
//                 onPrimary: Colors.white,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset("assets/icons/Transaction_profile.svg"),
//                   Container(width: 10),
//                   Text("عمليات التداول"),
//                   Spacer(flex: 3),
//                   SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//                 ],
//               ))),
//       Container(
//           decoration: BoxDecoration(
//               border: Border(
//             bottom: BorderSide(
//               width: 2,
//               color: Color(0xff3D4955),
//             ),
//           )),
//           child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.all(25.0),
//                 minimumSize: const Size.fromHeight(50),
//                 primary: Color(0xff0F1E2C),
//                 onPrimary: Colors.white,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset("assets/icons/Wallet_profile.svg"),
//                   Container(width: 10),
//                   Text("المحفظة"),
//                   Spacer(flex: 3),
//                   SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//                 ],
//               ))),
//       Container(
//           child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.all(25.0),
//                 minimumSize: const Size.fromHeight(50),
//                 primary: Color(0xff0F1E2C),
//                 onPrimary: Colors.white,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset("assets/icons/Settings_profile.svg"),
//                   Container(width: 10),
//                   Text("الإعدادات"),
//                   Spacer(flex: 3),
//                   SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//                 ],
//               ))),
//       Container(height: 50),
//       ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           minimumSize: Size(180, 1),
//           padding: EdgeInsets.all(5),
//           primary: Color(0xff263441),
//           onPrimary: Colors.white,
//         ),
//         child: Text("تسجيل خروج"),
//       ),
//     ],
//   ));

//             )
//           ),
//         child: ElevatedButton(
//           onPressed: (){},
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(25.0),
//              minimumSize: const Size.fromHeight(50),
//             primary: Color(0xff0F1E2C),
//             onPrimary: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               SvgPicture.asset("assets/icons/Wallet_profile.svg"),
//               Container(width: 10),
//               Text("المحفظة"),
//               Spacer(flex: 3),
//              SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//             ],
//           )
//         )
//     ),
//     Container(
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(
//                 width: 2,
//                 color: Color(0xff3D4955),
//               ),
//             )
//           ),
//         child: ElevatedButton(
//           onPressed: (){},
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(25.0),
//              minimumSize: const Size.fromHeight(50),
//             primary: Color(0xff0F1E2C),
//             onPrimary: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               SvgPicture.asset("assets/icons/BankAcc_profile.svg"),
//               Container(width: 10),
//               Text("الحسابات البنكية"),
//               Spacer(flex: 3),
//              SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//             ],
//           )
//         )
//     ),
//     Container(
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(
//                 width: 2,
//                 color: Color(0xff3D4955),
//               ),
//             )
//           ),
//         child: ElevatedButton(
//           onPressed: (){},
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(25.0),
//              minimumSize: const Size.fromHeight(50),
//             primary: Color(0xff0F1E2C),
//             onPrimary: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               SvgPicture.asset("assets/icons/ControlPannel_profile.svg"),
//               Container(width: 10),
//               Text("لوحة التحكم"),
//               Spacer(flex: 3),
//              SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//             ],
//           )
//         )
//     ),
//     Container(
//         child: ElevatedButton(
//           onPressed: (){},
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(25.0),
//              minimumSize: const Size.fromHeight(50),
//             primary: Color(0xff0F1E2C),
//             onPrimary: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               SvgPicture.asset("assets/icons/Settings_profile.svg"),
//               Container(width: 10),
//               Text("الإعدادات"),
//               Spacer(flex: 3),
//              SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
//             ],
//           )
//         )
//     ),

//       ],
//     )
//   );
// }
