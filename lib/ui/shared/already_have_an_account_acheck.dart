import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? " لديك حساب؟ " : "ليس لديك حساب؟ ",
          style: Constants.verySmallText.copyWith(color: Colors.white),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " تسجيل الدخول" : " إنشاء حساب ",
            style: Constants.verySmallText.copyWith(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
