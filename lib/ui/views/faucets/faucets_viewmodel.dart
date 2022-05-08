import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:clipboard/clipboard.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class FacucetsViewmodel extends BaseViewModel {
  final _walletService = locator<WalletManagmentService>();

  final _userService = locator<UserService>();

  void fund() {
    _walletService.fundMe(_userService.user.btcWallet!.address);
  }

  void fundEth() async {
    await FlutterClipboard.copy(_userService.user.ethWallet?.address ?? "");
    launchUrl(Uri.parse("https://rinkebyfaucet.com/"));
  }
}
