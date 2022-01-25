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
}
