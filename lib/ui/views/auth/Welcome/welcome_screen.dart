import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../shared/rounded_button.dart';
import '../Login/login_screen.dart';
import '../Signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/welcome.png"),
          fit: BoxFit.cover,
        ),
      ),
      // الديكور اللي بالاطراف(ممكن يكون صورة الخلفية)
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            right: 0,
            left: 0,
            child: Image.asset(
              "assets/icons/welcome-image.png",
            ),
          ),
          // محتوى الصفحة من الكلام
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // الترحيب
                Text(
                  "أهلا بك في عملة",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.white,
                      ),
                ),
                SizedBox(height: 100),
                Text(
                  "أشعر بتجربة التداول الجديدة",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                ),
                SizedBox(height: 90),
                // الزر الاول للدخول
                CustomButton(
                  text: "إنشاء حساب",
                  height: 45,
                  width: 200,
                  textStyle: Constants.smallText.copyWith(color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignupScreen();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),

                // الزر الثاني للتسجيل
                CustomButton(
                  text: "تسجيل الدخول",
                  color: Colors.white,
                  height: 45,
                  width: 200,
                  textStyle: Constants.smallText.copyWith(color: Colors.black),
                  onPressed: () {
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
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
