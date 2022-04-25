import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';

class WalletInfoViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  navigateToWithdrawView() {
    navService.navigateTo(Routes.withdrawView);
  }

  navigateToWalletEth() {
    navService.navigateTo(Routes.ethWalletInfoView);
  }

  navigateToWalletBTC() {
    navService.navigateTo(Routes.btcWalletInfoView);
  }

  navigateToWalletUsdt() {
    navService.navigateTo(Routes.usdtWalletInfoView);
  }

  navigateToWalletUni() {
    navService.navigateTo(Routes.uniWalletInfoView);
  }

  navigateToWalletBat() {
    navService.navigateTo(Routes.batWalletInfoView);
  }
}
