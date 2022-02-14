import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/supabase_service.dart';
import '../../../core/services/user_service.dart';

class SettingsViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final UserService userService = locator<UserService>();
  final supabaseService = locator<SupabaseService>();

  void logout() {
    _authService.signOut();
    _navService.replaceWith(Routes.welcomeView);
  }

  void updateProfileNav() {
    _navService.navigateTo(Routes.updateProfileView);
  }

  Future<void> updateUserName(String name) async {
    supabaseService.updateUserProfile(userService.user.profileId, name);
    final updatedUser =
        await supabaseService.getUser(userService.user.profileId);
    userService.updateUser(updatedUser);
    _navService.back();
  }

  Future<void> updateStatus(bool status) async {
    supabaseService.updateUserStatus(
        uuid: userService.user.profileId, status: status);
    final updatedUser =
        await supabaseService.getUser(userService.user.profileId);
    userService.updateUser(updatedUser);
  }

  bool getStatus() {
    return userService.user.isOnline;
    // return true;
  }
}
