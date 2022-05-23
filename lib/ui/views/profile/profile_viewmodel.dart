import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';

class ProfileViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();
  final _supabaseService = locator<SupabaseService>();

  String get email => _authService.currentUser?.email ?? "";

  void verifyUser() async {
    await _supabaseService.verifyUser(
      uuid: _userService.user.profileId,
      isVerified: true,
    );
  }

  bool isUserVerified() {
    return _userService.user.isVerified;
  }

  navigateToSettings() {
    navService.navigateTo(Routes.settingsHome);
  }

  navigateToWalletInfo() {
    navService.navigateTo(Routes.walletSelectionView);
  }

  navigateToDashboardInfo() {
    navService.navigateTo(Routes.adminDisputesView);
  }

  navigateToUserOffers() {
    navService.navigateTo(Routes.userOffersView);
  }

  void navigateToNfad() async {
    final bool completed = await navService.navigateTo(Routes.nfadMocView);

    if (completed) {
      verifyUser();
    }
  }

  navigateToBankAccounts() {
    navService.navigateTo(Routes.userBankAccountsView);
  }

  void navigateToTrades() {
    navService.navigateTo(Routes.userTradesView);
  }
}
