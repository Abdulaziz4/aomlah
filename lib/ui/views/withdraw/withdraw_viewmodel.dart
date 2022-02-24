import 'dart:convert';

import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/models/unconfirmed_transaction.dart';

import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/ui/views/withdraw/common/transaction_obj.dart';
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

  sendTran(String to, int amount, CryptoTypes types) async {
    setBusy(true);
    var userAddress, service;
    if (types == CryptoTypes.btc) {
      userAddress = userService.user.wallet!.address;
      UnconfirmedTransaction transaction =
          await walletService.sendTransaction(userAddress, to, amount);
      setBusy(false);
      navService.replaceWith(Routes.confirmWithdrawView,
          arguments: TransactionObj(transaction, types));
    } else if (types == CryptoTypes.eth) {
      userAddress = userService.user.walletETH!.address;
      UnconfirmedTransaction transaction =
          await ethWalletService.sendTransaction(userAddress, to, amount);
      setBusy(false);
      navService.replaceWith(Routes.confirmWithdrawView,
          arguments: TransactionObj(transaction, types));
    }
  }

  returnToWallet() {
    navService.back();
  }

  void signSendTransaction(
      UnconfirmedTransaction transaction, CryptoTypes types) async {
    setBusy(true);
    var userWallet;
    if (types == CryptoTypes.btc) {
      userWallet = userService.user.wallet!;
      Map<String, dynamic> signedJson =
          transaction.signedTransaction(userWallet);
      await walletService.sendSignedTransaction(signedJson);
      setBusy(false);
      navService.back();
    } else if (types == CryptoTypes.eth) {
      userWallet = userService.user.walletETH!;
      Map<String, dynamic> signedJson =
          transaction.signedTransaction(userWallet);
      await ethWalletService.sendSignedTransaction(signedJson);
      setBusy(false);
      navService.back();
    }
  }
}
