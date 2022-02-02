import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/already_have_an_account_acheck.dart';
import '../../../shared/rounded_button.dart';
import '../../../shared/rounded_input_field.dart';
import '../../../shared/rounded_password_field.dart';
import '../reset_password/reset_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF00101F),
      body: Container(
        width: double.infinity,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  alignment: Alignment.topRight,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/email_icon.svg",
                  height: 47,
                  width: 53,
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Color(0xFF447BAF),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'البريد الالكتروني',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
                RoundedInputField(
                  label: "",
                  hintText: "ادخل البريد الالكتروني",
                ),
                Text(
                  'كلمة السر',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(height: 50),
            RoundedButton(
              text: "تسجيل الدخول",
              color: Color(0xFF16A79E),
              press: () {},
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                'نسيت كلمة السر؟',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResetPasswordScreen();
                    },
                  ),
                );
              },
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
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
          ],
        ),
      ),
    );
  }
}
