import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/services/auth_service.dart';

class SettingsViewModel extends BaseViewModel{
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  void logout() {
    _authService.signOut();
    _navService.replaceWith(Routes.welcomeView);
  }
  void updateProfileNav(){
    _navService.navigateTo(Routes.updateProfile);
  }

}