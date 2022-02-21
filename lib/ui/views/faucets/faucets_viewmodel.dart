import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:stacked/stacked.dart';

import '../../../core/services/eth_wallet_managment_service.dart';

class FacucetsViewmodel extends BaseViewModel {
  final _walletService = locator<WalletManagmentService>();
  final _ethWalletService = locator<EthWalletManagmentService>();

  final _userService = locator<UserService>();

  void fund() {
    _walletService.fundMe(_userService.user.wallet!.address);
  }

  void fundEth() {
    _ethWalletService.fundMe(_userService.user.walletETH!.address);
  }
}
