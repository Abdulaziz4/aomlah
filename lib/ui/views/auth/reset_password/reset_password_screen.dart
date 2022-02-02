import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/app/utils/form_validator.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/auth/reset_password/reset_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../shared/rounded_input_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
        viewModelBuilder: () => ResetPasswordViewModel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'إعادة تعيين كلمة السر',
                        style: Constants.veryLargeText.copyWith(
                          color: Color(0xFF447BAF),
                          fontSize: 25,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/fluent_password-24-regular.svg",
                        height: 47,
                        width: 53,
                      ),
                    ],
                  ),
                  Form(
                    key: viewmodel.formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'سيتم إرسال رابط على الإيميل المدخل يمكنك من إعادة تعيين كلمة السر',
                          style:
                              Constants.smallText.copyWith(color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundedInputField(
                          hintText: "ادخل البريد الالكتروني",
                          label: "البريد الالكتروني",
                          validator: FormValidator.emailValidator,
                          onSave: (val) {
                            viewmodel.email = val!;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
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
                  if (viewmodel.successMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        viewmodel.successMessage ?? "",
                        style: Constants.verySmallText.copyWith(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                  CustomButton(
                    text: "إرسال",
                    color: Constants.primaryColor,
                    height: 40,
                    width: 200,
                    onPressed: viewmodel.submit,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
