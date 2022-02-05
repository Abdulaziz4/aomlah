import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A utility class that holds constants for useful and commonly
/// used values throughout the entire app.
/// This class has no constructor and all variables are `static`.
@immutable
class Constants {
  const Constants._();

  /// The main green color used for theming the app.
  static const Color primaryColor = Color(0xFF16A79E);

  /// The color value for red color in the app.
  static const Color redColor = Color(0xFFCF5050);

  // The color darb blue usually used for text.
  static const Color darkBlue = Color(0xFF447BAF);

  // The color light blue usually used for actions.
  static const Color lighBlue = Color(0xFF7BB9FA);

  // The color black with first elevation.
  static const Color black1dp = Color(0xFF00101F);

  // The color black with second elevation.
  static const Color black2dp = Color(0xFF0F1E2C);

  // The color black with third elevation.
  static const Color black3dp = Color(0xFF0F1E2C);

  // The color black with fourth elevation.
  static const Color black4dp = Color(0xFF33404C);

  // The color black with fifth elevation.
  static const Color black5dp = Color(0xFF404C57);

  /// The TextStyle for Roboto font in the app.
  static TextStyle robotoFont = GoogleFonts.cairo();

  // Shadow
  static List<BoxShadow> shadow = [
    BoxShadow(
      blurRadius: 4,
      spreadRadius: 2,
      offset: Offset(0, 4),
      color: Colors.black.withOpacity(0.1),
    )
  ];

  static TextStyle veryLargeText = GoogleFonts.cairo().copyWith(
    fontSize: 24,
  );

  static TextStyle largeText = GoogleFonts.cairo().copyWith(
    fontSize: 22,
  );
  static TextStyle mediumText = GoogleFonts.cairo().copyWith(
    fontSize: 19,
  );
  static TextStyle smallText = GoogleFonts.cairo().copyWith(
    fontSize: 17,
  );
  static TextStyle verySmallText = GoogleFonts.cairo().copyWith(
    fontSize: 15,
  );

  /// The regular expression for validating emails in the app.
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );

  /// The regular expression for validating contacts in the app.
  static RegExp contactRegex = RegExp(r'^(03|3)\d{9}$');

  /// The regular expression for validating full names in the app.
  static RegExp fullNameRegex = RegExp(r'^[a-zA-Z ]+$');

  /// The regular expression for validating zip codes in the app.
  static RegExp zipCodeRegex = RegExp(r'^\d{5}$');

  /// The regular expression for validating credit card numbers in the app.
  static RegExp creditCardNumberRegex =
      RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$');

  /// The regular expression for validating credit card CVV in the app.
  static RegExp creditCardCVVRegex = RegExp(r'^[0-9]{3}$');

  /// The regular expression for validating credit card expiry in the app.
  static RegExp creditCardExpiryRegex =
      RegExp(r'(0[1-9]|10|11|12)/20[0-9]{2}$');

  /// The regular expression for validating credit card expiry in the app.
  static final RegExp otpDigitRegex = RegExp('^[0-9]{1}\$');
}
