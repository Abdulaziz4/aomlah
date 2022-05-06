import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/auth_exception.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();

  final formKey = GlobalKey<FormState>();

  String email = "";
  String? successMessage;
  String? errorMessage;

  Future<void> submit() async {
    errorMessage = null;
    successMessage = null;
    notifyListeners();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    await resetPassword();
  }

  Future<void> resetPassword() async {
    try {
      setBusy(true);
      await _authService.sendPasswordResetCode(email: email);
      successMessage = "تم الإرسال";
    } on AuthException catch (e) {
      errorMessage = e.message;
    } catch (error) {
      errorMessage = "حدث خطأ";
    } finally {
      setBusy(false);
    }
  }
}
