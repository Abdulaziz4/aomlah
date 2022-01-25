import 'dart:async';

// import 'package:directory/core/app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:stacked_services/stacked_services.dart';

// import 'package:directory/core/app/auth_exception.dart';
// import 'package:directory/core/app/http_exception.dart';
// import 'package:directory/core/app/locator.dart';
// import 'package:directory/core/models/darb_user.dart';
// import 'package:directory/core/services/api/api_service.dart';
// import 'package:directory/core/services/darb_user_provider.dart';
// import 'package:directory/ui/shared/setup_dialog_ui.dart';

class AuthService {
  // final _logger = getLogger("AuthService");

  // final _apiService = locator<APIService>();
  // final _dialogService = locator<DialogService>();
  late FirebaseAuth _firebaseAuth;

  String? _token;
  String? get token => _token;
  User? get currentUser => _firebaseAuth.currentUser;

  // StreamController<DarbUserProvider> userController =
  //     StreamController<DarbUserProvider>();

  // Future<void> initUserAndToken() async {
  //   _logger.i("initUserAndToken");
  //   try {
  //     _token = await currentUser!.getIdToken();
  //     final user = await _apiService.getUser();
  //     registerUser(user);
  //   } on HttpException catch (exp) {
  //     _logger.e("Initlizing user failed :" + exp.toString());
  //     _dialogService.showCustomDialog(
  //       variant: DialogType.connection_problem,
  //     );
  //     throw exp;
  //   } catch (e) {
  //     _logger.e("Initlizing user failed :" + e.toString());
  //     _dialogService.showCustomDialog(
  //       variant: DialogType.general_problem,
  //     );
  //     throw e;
  //   }
  // }

  // void registerUser(DarbUser user) {
  //   _logger.i("registerUser | user=${user.toString()}");

  //   user.isAnonymous = currentUser?.isAnonymous ?? true;
  //   userController.add(DarbUserProvider(user));
  // }

  bool isUserLoggedIn() {
    return currentUser != null;
  }

  Future<void> signInAnounomisly() async {
    try {
      await _firebaseAuth.signInAnonymously();
      // await initUserAndToken();
    } catch (exp) {
      throw exp;
    }
  }

  Future<void> initService() async {
    await Firebase.initializeApp();
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<void> signOut() async {
    // _logger.i("signOut");

    await _firebaseAuth.signOut();
    _token = null;
  }

  Future<bool> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    // _logger.i("signUpWithEmail | email=$email , password=$password");
    try {
      final authRes = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final success = authRes.user != null;
      // if (success) {
      //   await initUserAndToken();
      // }

      return success;
    } on FirebaseAuthException catch (exp) {
      // _logger.e(
      //     'Signup Failed with error code: ${exp.code} , Message: ${exp.message}');
      // throw AuthException(exp.code);
      return false;
    } catch (exp) {
      // _logger.e('Signup Failed with error code: $exp , Message: $exp');
      // throw exp;
      return false;
    }
  }

  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    // _logger.i("loginWithEmail | email=$email , password=$password");

    try {
      final authRes = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final success = authRes.user != null;
      if (success) {
        // await initUserAndToken();
      }

      return success;
    } on FirebaseAuthException catch (exp) {
      // _logger.e(
      //     'login Failed with error code: ${exp.code} , Message: ${exp.message}');

      // throw AuthException(exp.code);
      return false;
    } catch (e) {
      // _logger.e('login Failed with error code: $e , Message: $e');
      // throw e;
      return false;
    }
  }

  Future<void> sendPasswordResetCode({required String email}) async {
    // _logger.i("sendPasswordResetCode | email=$email");
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } catch (exp) {
      // _logger.e("sendPasswordResetCode failed with error: $exp");
      rethrow;
    }
  }
}
