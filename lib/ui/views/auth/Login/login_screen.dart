import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/app/utils/form_validator.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/auth/login/login_viewmodel.dart';
import 'package:aomlah/ui/views/auth/reset_password/reset_password_screen.dart';
import 'package:aomlah/ui/views/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../shared/already_have_an_account_acheck.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
              appBar: AppBar(elevation: 0),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'تسجيل الدخول',
                          style: Constants.veryLargeText.copyWith(
                            color: Constants.darkBlue,
                            fontSize: 28,
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
                      height: 20,
                    ),
                    Form(
                      key: viewmodel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RoundedInputField(
                            label: "البريد الالكتروني",
                            hintText: "ادخل البريد الالكتروني",
                            validator: FormValidator.emailValidator,
                            onSave: (value) {
                              viewmodel.email = value!;
                            },
                          ),
                          RoundedInputField(
                            label: "كلمة السر",
                            hintText: "ادخل كلمة السر",
                            obscure: true,
                            validator: FormValidator.passwordValidator,
                            onSave: (value) {
                              viewmodel.password = value!;
                            },
                          ),
                          GestureDetector(
                            child: Text(
                              'نسيت كلمة السر؟',
                              style: Constants.smallText.copyWith(
                                color: Constants.primaryColor,
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
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    if (viewmodel.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          viewmodel.errorMessage ?? "",
                          style: Constants.verySmallText.copyWith(
                            color: Constants.redColor,
                          ),
                        ),
                      ),
                    CustomButton(
                      text: "تسجيل الدخول",
                      height: 40,
                      width: 200,
                      color: Constants.primaryColor,
                      onPressed: viewmodel.submit,
                    ),
                    SizedBox(height: 10),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
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
                  ],
                ),
              ),
            ),
          );
        });
  }
}
