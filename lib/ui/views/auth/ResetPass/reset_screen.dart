import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/already_have_an_account_acheck.dart';
import '../../../shared/rounded_button.dart';
import '../../../shared/rounded_input_field.dart';
import '../../../shared/rounded_password_field.dart';
import '../Login/login_screen.dart';

class ResetScreen extends StatelessWidget {
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
            Container(
              height: 20,
              child: Row(
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
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/fluent_password-24-regular.svg",
                    height: 47,
                    width: 53,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'إعادة تعيين كلمة السر',
                    style: TextStyle(
                      color: Color(0xFF447BAF),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const <Widget>[
                Text(
                  'سيتم إرسال رابط على الإيميل المدخل يمكنك من إعادة تعيين كلمة السر',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'البريد الالكتروني',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
                RoundedInputField(
                  hintText: "ادخل البريد الالكتروني",
                  label: "",
                ),
              ],
            ),
            SizedBox(height: 20),
            RoundedButton(
              text: "إرسال",
              color: Color(0xFF16A79E),
              press: () {},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
