import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/already_have_an_account_acheck.dart';
import '../../../shared/rounded_button.dart';
import '../../../shared/rounded_input_field.dart';
import '../../../shared/rounded_password_field.dart';
import '../Signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_forward_ios,
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
                    "assets/icons/email_icon.svg",
                    height: 47,
                    width: 53,
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      color: Color(0xFF447BAF),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'الاسم',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    RoundedInputField(
                      hintText: "ادخل الاسم",
                      onChanged: (value) {},
                    ),
                    Text(
                      'البريد الالكتروني',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                    RoundedInputField(
                      hintText: "ادخل البريد الالكتروني",
                      onChanged: (value) {},
                    ),
                    Text(
                      'كلمة السر',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                    Text(
                      'تأكيد كلمة السر',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 20),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Theme(data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.white,
                            ),
                                child: Checkbox(value: false,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   value = !value!;
                                    //   },
                                    // );
                                  }, checkColor: Colors.teal,)),
                            Text('أوافق  على الشروط والأحكام', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ],

                        ),
                        RoundedButton(
                          text: "إنشاء حساب",
                          color: Color(0xFF16A79E),
                          press: () {
                            if (!_formKey.currentState!.validate()) return;
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ),

            SizedBox(height: 20),

            AlreadyHaveAnAccountCheck(
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
    );
  }

}
