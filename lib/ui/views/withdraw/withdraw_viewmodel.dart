import 'dart:convert';

import 'package:aomlah/core/models/unconfirmed_transaction.dart';

import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/services/eth_wallet_managment_service.dart';
import '../../../core/services/wallet_managment_service.dart';

class WithdrawViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  final walletService = locator<WalletManagmentService>();
  final ethWalletService = locator<EthWalletManagmentService>();
  final userService = locator<UserService>();

  sendTran(String to, int amount) async {
    setBusy(true);
    UnconfirmedTransaction transaction = await walletService.sendTransaction(
        userService.user.wallet!.address, to, amount);
    setBusy(false);
    navService.replaceWith(Routes.confirmWithdrawView, arguments: transaction);
  }

  returnToWallet() {
    navService.back();
  }

  void signSendTransaction(UnconfirmedTransaction transaction) async {
    setBusy(true);
    Map<String, dynamic> signedJson =
        transaction.signedTransaction(userService.user.wallet!);
    await walletService.sendSignedTransaction(signedJson);
    setBusy(false);
    navService.back();
  }
}
