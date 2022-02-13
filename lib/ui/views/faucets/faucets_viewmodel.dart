import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:stacked/stacked.dart';

class FacucetsViewmodel extends BaseViewModel {
  final _walletService = locator<WalletManagmentService>();
  final _userService = locator<UserService>();

  void fund() {
    _walletService.fundMe(_userService.user.wallet!.address);
  }
}
