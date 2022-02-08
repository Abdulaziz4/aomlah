import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OffersDiscoveryViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  void logout() {
    _authService.signOut();
    _navService.replaceWith(Routes.welcomeView);
  }
}
