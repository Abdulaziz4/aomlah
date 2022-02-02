import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/app/utils/form_validator.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/auth/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/already_have_an_account_acheck.dart';
import '../../../shared/rounded_button.dart';
import '../../../shared/rounded_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'إنشاء حساب',
                    style: Constants.veryLargeText.copyWith(
                      fontSize: 28,
                      color: Constants.darkBlue,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/email_icon.svg",
                    height: 47,
                    width: 53,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      RoundedInputField(
                        label: "الاسم",
                        hintText: "ادخل الاسم",
                        validator: FormValidator.nameValidator,
                      ),
                      RoundedInputField(
                        label: "البريد الالكتروني",
                        hintText: "ادخل البريد الالكتروني",
                        validator: FormValidator.emailValidator,
                      ),
                      RoundedInputField(
                        label: "كلمة السر",
                        hintText: "**********",
                        obscure: true,
                        validator: FormValidator.passwordValidator,
                      ),
                      RoundedInputField(
                        label: "تأكيد كلمة السر",
                        hintText: "**********",
                        obscure: true,
                        // validator:(cp)=> FormValidator.confirmPasswordValidator(cp),
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: Colors.white,
                                ),
                                child: Checkbox(
                                  value: isAgreed,
                                  onChanged: (value) {
                                    setState(() {
                                      isAgreed = !isAgreed;
                                    });
                                  },
                                  checkColor: Constants.primaryColor,
                                ),
                              ),
                              Text(
                                'أوافق  على الشروط والأحكام',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          CustomButton(
                            text: "إنشاء حساب",
                            color: Color(0xFF16A79E),
                            width: 200,
                            height: 40,
                            onPressed: () {
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
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
