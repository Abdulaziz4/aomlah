import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/app/utils/form_validator.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/auth/Login/login_screen.dart';
import 'package:aomlah/ui/views/auth/Signup/signup_viewmodel.dart';
import '../../../shared/already_have_an_account_acheck.dart';
import '../../../shared/rounded_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isAgreed = false;

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        viewModelBuilder: () => SignupViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
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
                        key: viewmodel.formKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              RoundedInputField(
                                label: "الاسم",
                                hintText: "ادخل الاسم",
                                validator: FormValidator.nameValidator,
                                onSave: (value) {
                                  viewmodel.name = value!;
                                },
                              ),
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
                                hintText: "**********",
                                obscure: true,
                                validator: FormValidator.passwordValidator,
                                controller: passwordController,
                                onSave: (value) {
                                  viewmodel.password = value!;
                                },
                              ),
                              RoundedInputField(
                                label: "تأكيد كلمة السر",
                                hintText: "**********",
                                obscure: true,
                                validator: (cp) =>
                                    FormValidator.confirmPasswordValidator(
                                  cp,
                                  passwordController.text,
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  if (viewmodel.errorMessage != null)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        viewmodel.errorMessage ?? "",
                                        style: Constants.verySmallText.copyWith(
                                          color: Constants.redColor,
                                        ),
                                      ),
                                    ),
                                  CustomButton(
                                    text: "إنشاء حساب",
                                    color: Color(0xFF16A79E),
                                    width: 200,
                                    height: 40,
                                    onPressed: viewmodel.submit,
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
            ),
          );
        });
  }
}
