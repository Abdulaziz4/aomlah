import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/auth_exception.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';

class AuthService {
  final _logger = getLogger("AuthService");

  final _supabaseService = locator<SupabaseService>();
  // final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();

  final GoTrueClient _supabaseAuth = Supabase.instance.client.auth;

  User? get currentUser => _supabaseAuth.currentUser;

  Future<void> initUser() async {
    _logger.i("initUserAndToken");
    try {
      if (isUserLoggedIn()) {
        // final user = await _supabaseService.fetchUserById(currentUser!.id);
        // _userService.updateUser(user);
      } else {
        // _userService.updateUser(DarbUser.anonymous());
      }
    } catch (e) {
      _logger.e("Initlizing user failed :" + e.toString());
      // _dialogService.showCustomDialog(
      //   variant: DialogType.general_problem,
      // );
      rethrow;
    }
  }

  bool isUserLoggedIn() {
    return _supabaseAuth.currentUser != null;
  }

  Future<void> signOut() async {
    _logger.i("signOut");

    await _supabaseAuth.signOut();
  }

  void signinAnonymously() {
    // _userService.updateUser(DarbUser.anonymous());
  }

  // Creates a new user
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    _logger.i("signUpWithEmail | email=$email , password=$password");
    try {
      Supabase.instance.client.auth;
      final authRes = await _supabaseAuth.signUp(
        email,
        password,
      );

      final hasError = authRes.error != null;
      // User's email is not confirmed
      final hasNoData = authRes.data == null && authRes.user == null;

      if (hasError || hasNoData) {
        throw AuthException(authRes.error?.message ?? "");
      } else {
        await initUser();
      }
    } on AuthException catch (exp) {
      _logger.e(
          'Signup Failed with error code: ${exp.code} , Message:${exp.message} ');
      rethrow;
    } catch (exp) {
      _logger.e('Signup Failed with error code: $exp , Message: $exp');
      rethrow;
    }
  }

  // Log an already registered user in
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    _logger.i("loginWithEmail | email=$email , password=$password");

    try {
      final authRes = await _supabaseAuth.signIn(
        email: email,
        password: password,
      );
      final hasError = authRes.error != null;
      if (hasError) {
        throw AuthException(authRes.error?.message ?? "");
      } else {
        await initUser();
      }
    } on AuthException catch (exp) {
      _logger.e(
          'login Failed with error code: ${exp.code} , Message:${exp.message} ');
      rethrow;
    } catch (e) {
      _logger.e('login Failed with error code: $e , Message: ');
      rethrow;
    }
  }

  // Resets user email paswword through email message
  Future<void> sendPasswordResetCode({required String email}) async {
    _logger.i("sendPasswordResetCode | email=$email");
    try {
      await _supabaseAuth.api.resetPasswordForEmail(
        email,
      );
    } catch (exp) {
      _logger.e("sendPasswordResetCode failed with error: $exp");
      rethrow;
    }
  }
}
