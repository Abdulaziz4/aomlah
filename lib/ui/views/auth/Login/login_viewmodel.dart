import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/auth_exception.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  String? errorMessage;

  Future<void> submit() async {
    errorMessage = null;
    notifyListeners();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    login();
  }

  Future<void> login() async {
    try {
      setBusy(true);
      await _authService.loginWithEmail(email: email, password: password);
      _navService.navigateTo(Routes.navigationView);
    } on AuthException catch (e) {
      errorMessage = e.message;
    } catch (error) {
      errorMessage = "حدث خطأ";
    } finally {
      setBusy(false);
    }
  }
}
