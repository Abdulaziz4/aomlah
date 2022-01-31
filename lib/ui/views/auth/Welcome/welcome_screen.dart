import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/rounded_button.dart';
import '../Login/login_screen.dart';
import '../Signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(




      body: Container(
        height: size.height,
        width: double.infinity,



        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welcome.png" ),
              fit: BoxFit.cover,
            ),
         ),








        // الديكور اللي بالاطراف(ممكن يكون صورة الخلفية)
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Image.asset('assets/images/welcome.png'),

            Positioned(
              right: 0,
              left: 0,

              child: Image.asset(
                "assets/images/Rectangle 1.png",
              ),
            ),

            // محتوى الصفحة من الكلام
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 150),

                  // الترحيب
                  Text(
                    "أهلا بك في عملة",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36, color: Colors.white),
                  ),
                  SizedBox(height: 100),
                  Text(
                    "أشعر بتجربة التداول الجديدة",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                  ),
                  // الصورتين اللي بالنص
                  // Image.asset(
                  //   "assets/images/welcome.png",
                  //   // height: size.height * 0.45,
                  //   height: size.height,
                  //   width: double.infinity,
                  // ),


                  SizedBox(height: 50),

                  // الزر الاول للدخول
                  RoundedButton(
                    text: "إنشاء حساب",
                    color: Colors.teal,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),

                  // الزر الثاني للتسجيل
                  RoundedButton(
                    text: "تسجيل الدخول",
                    color: Colors.white,
                    textColor: Colors.black,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),


                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}

