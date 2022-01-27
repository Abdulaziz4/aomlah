import 'package:flutter/material.dart';

import 'constants.dart';

/// A utility class that holds themes for the app.
/// This class has no constructor and all methods are `static`.
@immutable
class CustomTheme {
  const CustomTheme._();

  /// The main starting theme for the app.
  ///
  /// Sets the following defaults:
  /// * primaryColor: [Constants.primaryColor],
  /// * scaffoldBackgroundColor: [Constants.scaffoldColor],
  /// * fontFamily: [Constants.poppinsFont].fontFamily,
  /// * iconTheme: [Colors.white] for default icon
  /// * textButtonTheme: [TextButtonTheme] without the default padding,
  static late final mainTheme = ThemeData(
    primaryColor: Constants.primaryColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Constants.primaryColor,
      secondary: Constants.primaryColor,
    ),
    scaffoldBackgroundColor: Constants.black1dp,
    fontFamily: Constants.robotoFont.fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Constants.black1dp,
      titleTextStyle: Constants.robotoFont.copyWith(
        fontSize: 24,
        color: Constants.darkBlue,
      ),
    ),
    textTheme: TextTheme(
      headline1: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.15,
      ),
      headline2: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        height: 1.15,
      ),
      headline3: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 1.15,
      ),
      headline4: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.15,
      ),
      headline5: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        height: 1.15,
      ),
      headline6: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        height: 1.15,
      ),
      subtitle1: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w200,
      ),
      subtitle2: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w200,
      ),
      bodyText1: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w400,
      ),
      bodyText2: Constants.robotoFont.copyWith(
        fontWeight: FontWeight.w400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
