import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  String password = "";

  Future<void> submit() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    try {
      setBusy(true);

      await _authService.signUpWithEmail(
        email: email,
        password: password,
        name: name,
      );

      setBusy(false);
    } catch (error) {}
  }
}
