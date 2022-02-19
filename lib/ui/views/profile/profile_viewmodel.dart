import 'package:aomlah/core/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';

class ProfileViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  String get email => _authService.currentUser?.email ?? "";

  navigateToSettings() {
    navService.navigateTo(Routes.settingsHome);
  }

  navigateToWalletInfo() {
    navService.navigateTo(Routes.walletInfoView);
  }

  navigateToUserOffers() {
    navService.navigateTo(Routes.userOffersView);
  }

  navigateToBankAccounts() {
    navService.navigateTo(Routes.userBankAccountsView);
  }
}
