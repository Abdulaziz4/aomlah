import 'package:aomlah/core/app/utils/string_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A utility class that holds methods for validating different textFields.
/// This class has no constructor and all methods are `static`.
@immutable
class FormValidator {
  const FormValidator._();

  static String? hasValue(String? value) {
    print(value);
    if (value == null || value.isEmpty) {
      return "الرجاء عدم ترك  الخانة فارغة";
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "الرجاء إدخال اسم";
    }
    return null;
  }

  /// A method containing validation logic for email input.
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "الرجاء إدخال ايميل";
    } else if (!email.isValidEmail) {
      return "الرجاء إدخال ايميل صحيح";
    }
    return null;
  }

  /// A method containing validation logic for password input.
  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "الرجاء إدخال كلمة سر";
    } else if (password.length < 8) {
      return "الرجاء إدخال كلمة سر أكثر من ٨ احرف";
    }
    return null;
  }

  /// A method containing validation logic for confirm password input.
  static String? confirmPasswordValidator(String? confirmPw, String inputPw) {
    if (confirmPw == null || confirmPw.isEmpty) {
      return "الرجاء إدخال كلمة سر";
    } else if (confirmPw.length < 8) {
      return "الرجاء إدخال كلمة سر أكثر من ٨ احرف";
    }
    if (confirmPw != inputPw.trim()) {
      return "كلة السر غير مطابقة";
    }
    return null;
  }

  /// A method containing validation logic for current password input.
  static String? currentPasswordValidator(String? inputPw, String currentPw) {
    if (inputPw == currentPw) return null;
    return "الرجاء التاكد من كلمة السر";
  }
}
