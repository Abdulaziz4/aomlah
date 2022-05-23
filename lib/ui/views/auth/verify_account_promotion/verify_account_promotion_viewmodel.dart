import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyAccountViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _supabaseService = locator<SupabaseService>();

  void navigateToHome() {
    navService.navigateTo(Routes.navigationView);
  }

  Future<void> sendVerificationRequest() async {
    await _supabaseService.verifyUser(
      uuid: _userService.user.profileId,
      isVerified: true,
    );
  }

  Future<void> tryVerifyUser() async {
    final bool completed = await navService.navigateTo(Routes.nfadMocView);

    if (completed) {
      sendVerificationRequest();
      navService.replaceWith(Routes.navigationView);
    }
  }
}
